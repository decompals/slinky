/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::PathBuf;
use std::{collections::HashSet, io::Write, path::Path};

use crate::{file_kind::FileKind, SlinkyError};
use crate::{utils, Settings};
use crate::{FileInfo, Segment};

pub struct LinkerWriter<'a> {
    pub linker_symbols: HashSet<String>,

    // Used for dependency generation
    files_paths: Vec<PathBuf>,

    indent_level: i32,
    buffer: Vec<String>,

    single_segment: bool,

    settings: &'a Settings,
}

impl<'a> LinkerWriter<'a> {
    pub fn new(settings: &'a Settings) -> Self {
        Self {
            linker_symbols: HashSet::new(),
            files_paths: Vec::new(),
            indent_level: 0,
            buffer: Vec::new(),

            single_segment: false,

            settings,
        }
    }

    pub fn begin_sections(&mut self) {
        self.writeln("SECTIONS");
        self.begin_block();

        self.writeln("__romPos = 0x0;");

        if let Some(hardcoded_gp_value) = self.settings.hardcoded_gp_value {
            self.writeln(&format!("_gp = 0x{:08X};", hardcoded_gp_value));
        }

        self.writeln("");
    }

    pub fn end_sections(&mut self) {
        let mut need_ln = false;

        if !self.settings.sections_allowlist.is_empty() {
            let address = " 0";

            for sect in &self.settings.sections_allowlist {
                self.writeln(&format!("{}{} :", sect, address));
                self.begin_block();

                self.writeln(&format!("*({});", sect));

                self.end_block();
            }

            need_ln = true;
        }

        if !self.settings.sections_allowlist_extra.is_empty() {
            if need_ln {
                self.writeln("");
            }

            let address = " 0";

            for sect in &self.settings.sections_allowlist_extra {
                self.writeln(&format!("{}{} :", sect, address));
                self.begin_block();

                self.writeln(&format!("*({});", sect));

                self.end_block();
            }

            need_ln = true;
        }

        if self.settings.discard_wildcard_section || !self.settings.sections_denylist.is_empty() {
            if need_ln {
                self.writeln("");
            }

            self.writeln("/DISCARD/ :");
            self.begin_block();

            for sect in &self.settings.sections_denylist {
                self.writeln(&format!("*({});", sect));
            }

            if self.settings.discard_wildcard_section {
                self.writeln("*(*);")
            }

            self.end_block();
        }

        self.end_block();
        assert!(self.indent_level == 0);
    }

    pub fn add_segment(&mut self, segment: &Segment) {
        assert!(!self.single_segment);

        let style = &self.settings.linker_symbols_style;
        let dotted_seg_name = format!(".{}", segment.name);

        // rom segment symbols
        let main_seg_rom_sym_start: String = style.segment_rom_start(&segment.name);
        let main_seg_rom_sym_end: String = style.segment_rom_end(&segment.name);
        let main_seg_rom_sym_size: String = style.segment_rom_size(&segment.name);

        // vram segment symbols
        let main_seg_sym_start: String = style.segment_vram_start(&segment.name);
        let main_seg_sym_end: String = style.segment_vram_end(&segment.name);
        let main_seg_sym_size: String = style.segment_vram_size(&segment.name);

        if let Some(segment_start_align) = segment.segment_start_align {
            self.align_symbol("__romPos", segment_start_align);
            self.align_symbol(".", segment_start_align);
        }

        self.write_symbol(&main_seg_rom_sym_start, "__romPos");
        self.write_symbol(&main_seg_sym_start, &format!("ADDR({})", dotted_seg_name));

        // Emit alloc segment
        self.write_segment(segment, &dotted_seg_name, &segment.alloc_sections, false);

        self.writeln("");

        // Emit noload segment
        self.write_segment(segment, &dotted_seg_name, &segment.noload_sections, true);

        self.write_sym_end_size(
            &main_seg_sym_start,
            &main_seg_sym_end,
            &main_seg_sym_size,
            ".",
        );

        self.writeln(&format!("__romPos += SIZEOF({});", dotted_seg_name));
        self.write_sym_end_size(
            &main_seg_rom_sym_start,
            &main_seg_rom_sym_end,
            &main_seg_rom_sym_size,
            "__romPos",
        );

        self.writeln("");
    }

    pub fn add_single_segment(&mut self, segment: &Segment) {
        assert!(self.buffer.is_empty());

        // Make sure this function is called only once
        assert!(!self.single_segment);
        self.single_segment = true;

        let style = &self.settings.linker_symbols_style;

        self.writeln("SECTIONS");
        self.begin_block();

        //let dotted_seg_name = format!(".{}", segment.name);

        // Emit alloc segment
        //self.write_single_segment(segment, &dotted_seg_name, &segment.alloc_sections, false);

        //self.writeln("");

        // Emit noload segment
        //self.write_single_segment(segment, &dotted_seg_name, &segment.noload_sections, true);

        for section in &self.settings.alloc_sections {
            let mut line = String::new();

            line += &format!("{} :", section);

            if let Some(subalign) = segment.subalign {
                line += &format!(" SUBALIGN({})", subalign);
            }

            self.writeln(&line);
            self.begin_block();

            if let Some(fill_value) = segment.fill_value {
                self.writeln(&format!("FILL(0x{:08X});", fill_value));
            }

            let section_start_sym = style.segment_section_start(&segment.name, section);
            let section_end_sym = style.segment_section_end(&segment.name, section);
            let section_size_sym = style.segment_section_size(&segment.name, section);

            self.write_symbol(&section_start_sym, ".");

            self.emit_section(segment, section);

            if let Some(section_end_align) = segment.section_end_align {
                self.align_symbol(".", section_end_align);
            }
            self.write_sym_end_size(&section_start_sym, &section_end_sym, &section_size_sym, ".");

            self.end_block();

            self.writeln("");
        }

        for section in &self.settings.noload_sections {
            let mut line = String::new();

            line += &format!("{} (NOLOAD) :", section);

            if let Some(subalign) = segment.subalign {
                line += &format!(" SUBALIGN({})", subalign);
            }

            self.writeln(&line);
            self.begin_block();

            if let Some(fill_value) = segment.fill_value {
                self.writeln(&format!("FILL(0x{:08X});", fill_value));
            }

            let section_start_sym = style.segment_section_start(&segment.name, section);
            let section_end_sym = style.segment_section_end(&segment.name, section);
            let section_size_sym = style.segment_section_size(&segment.name, section);

            self.write_symbol(&section_start_sym, ".");

            self.emit_section(segment, section);

            if let Some(section_end_align) = segment.section_end_align {
                self.align_symbol(".", section_end_align);
            }
            self.write_sym_end_size(&section_start_sym, &section_end_sym, &section_size_sym, ".");

            self.end_block();

            self.writeln("");
        }

        self.end_sections();
    }

    pub fn save_linker_script(&self, path: &Path) -> Result<(), SlinkyError> {
        let mut f = utils::create_file_and_parents(path)?;

        for line in &self.buffer {
            if let Err(e) = writeln!(f, "{}", line) {
                return Err(SlinkyError::FailedFileWrite {
                    path: path.to_path_buf(),
                    description: e.to_string(),
                    contents: line.into(),
                });
            }
        }

        Ok(())
    }

    #[must_use]
    pub fn export_as_string(&self) -> String {
        let mut ret = String::new();

        for line in &self.buffer {
            ret += &format!("{}\n", line);
        }

        ret
    }

    pub fn save_dependencies_file(
        &mut self,
        path: &Path,
        target_path: &Path,
    ) -> Result<(), SlinkyError> {
        let mut f = utils::create_file_and_parents(path)?;

        if let Err(e) = write!(f, "{}:", target_path.display()) {
            return Err(SlinkyError::FailedFileWrite {
                path: path.to_path_buf(),
                description: e.to_string(),
                contents: target_path.display().to_string(),
            });
        }

        for p in &self.files_paths {
            if let Err(e) = write!(f, " \\\n    {}", p.display()) {
                return Err(SlinkyError::FailedFileWrite {
                    path: path.to_path_buf(),
                    description: e.to_string(),
                    contents: p.display().to_string(),
                });
            }
        }

        if let Err(e) = write!(f, "\n\n") {
            return Err(SlinkyError::FailedFileWrite {
                path: path.to_path_buf(),
                description: e.to_string(),
                contents: "".to_string(),
            });
        }

        for p in &self.files_paths {
            if let Err(e) = writeln!(f, "{}:", p.display()) {
                return Err(SlinkyError::FailedFileWrite {
                    path: path.to_path_buf(),
                    description: e.to_string(),
                    contents: p.display().to_string(),
                });
            }
        }

        Ok(())
    }

    #[must_use]
    pub fn export_dependencies_as_string(&self, target_path: &Path) -> String {
        let mut ret = String::new();

        ret += &format!("{}:", target_path.display());

        for p in &self.files_paths {
            ret += &format!(" \\\n    {}", p.display());
        }

        ret += "\n\n";

        for p in &self.files_paths {
            ret += &format!("{}:\n", p.display());
        }

        ret
    }

    pub fn save_symbol_header(&self, path: &Path) -> Result<(), SlinkyError> {
        let mut f = utils::create_file_and_parents(path)?;

        if let Err(e) = write!(f, "#ifndef HEADER_SYMBOLS_H\n#define HEADER_SYMBOLS_H\n\n") {
            return Err(SlinkyError::FailedFileWrite {
                path: path.to_path_buf(),
                description: e.to_string(),
                contents: "".into(),
            });
        }

        let arr_suffix = if self.settings.symbols_header_as_array {
            "[]"
        } else {
            ""
        };

        let mut linker_symbols_sorted: Vec<_> = self.linker_symbols.iter().collect();
        linker_symbols_sorted.sort();

        for sym in linker_symbols_sorted {
            if let Err(e) = writeln!(
                f,
                "extern {} {}{};",
                self.settings.symbols_header_type, sym, arr_suffix
            ) {
                return Err(SlinkyError::FailedFileWrite {
                    path: path.to_path_buf(),
                    description: e.to_string(),
                    contents: sym.into(),
                });
            }
        }

        if let Err(e) = write!(f, "\n#endif\n") {
            return Err(SlinkyError::FailedFileWrite {
                path: path.to_path_buf(),
                description: e.to_string(),
                contents: "".into(),
            });
        }

        Ok(())
    }

    #[must_use]
    pub fn export_symbol_header_as_string(&self) -> String {
        let mut ret = String::new();

        ret += "#ifndef HEADER_SYMBOLS_H\n#define HEADER_SYMBOLS_H\n\n";

        let arr_suffix = if self.settings.symbols_header_as_array {
            "[]"
        } else {
            ""
        };

        let mut linker_symbols_sorted: Vec<_> = self.linker_symbols.iter().collect();
        linker_symbols_sorted.sort();

        for sym in linker_symbols_sorted {
            ret += &format!(
                "extern {} {}{};\n",
                self.settings.symbols_header_type, sym, arr_suffix
            );
        }

        ret += "\n#endif\n";

        ret
    }
}

// internal functions
impl LinkerWriter<'_> {
    fn writeln(&mut self, line: &str) {
        if line.is_empty() {
            self.buffer.push("".to_string());
        } else {
            let mut temp = String::new();

            for _i in 0..self.indent_level {
                temp += "    ";
            }

            temp += line;
            self.buffer.push(temp);
        }
    }

    fn begin_block(&mut self) {
        self.writeln("{");
        self.indent_level += 1;
    }

    fn end_block(&mut self) {
        assert!(self.indent_level > 0);
        self.indent_level -= 1;
        self.writeln("}");
    }

    fn write_symbol(&mut self, symbol: &str, value: &str) {
        // TODO: check `symbol` is a valid C identifier

        self.writeln(&format!("{} = {};", symbol, value));

        self.linker_symbols.insert(symbol.to_string());
    }

    fn align_symbol(&mut self, symbol: &str, align_value: u32) {
        self.writeln(&format!(
            "{} = ALIGN({}, 0x{:X});",
            symbol, symbol, align_value
        ));
    }

    fn write_sym_end_size(&mut self, start: &str, end: &str, size: &str, value: &str) {
        self.write_symbol(end, value);

        self.write_symbol(size, &format!("ABSOLUTE({} - {})", end, start));
    }

    fn write_segment_start(
        &mut self,
        segment: &Segment,
        dotted_seg_name: &str,
        noload: bool,
        seg_sym_start: &str,
    ) {
        let style = &self.settings.linker_symbols_style;

        self.write_symbol(seg_sym_start, ".");

        let name_suffix = if noload { ".noload" } else { "" };
        let mut line = format!("{}{}", dotted_seg_name, name_suffix);

        if noload {
            line += " (NOLOAD) :";
        } else {
            if let Some(fixed_vram) = segment.fixed_vram {
                line += &format!(" 0x{:08X}", fixed_vram);
            } else if let Some(follows_segment) = &segment.follows_segment {
                line += &format!(" {}", style.segment_vram_end(follows_segment));
            }

            line += &format!(" : AT({})", style.segment_rom_start(&segment.name));
        }

        if let Some(subalign) = segment.subalign {
            line += &format!(" SUBALIGN({})", subalign);
        }

        self.writeln(&line);
        self.begin_block();
    }

    fn write_segment_end(
        &mut self,
        _segment: &Segment,
        _dotted_seg_name: &str,
        _noload: bool,
        seg_sym_start: &str,
        seg_sym_end: &str,
        seg_sym_size: &str,
    ) {
        self.end_block();

        self.write_sym_end_size(seg_sym_start, seg_sym_end, seg_sym_size, ".");
    }

    fn emit_file(&mut self, file: &FileInfo, segment: &Segment, section: &str, base_path: &Path) {
        let style = &self.settings.linker_symbols_style;

        let wildcard = if segment.wildcard_sections { "*" } else { "" };

        // TODO: figure out glob support
        match file.kind {
            FileKind::Object => {
                let mut path = base_path.to_path_buf();
                path.extend(&file.path);

                self.writeln(&format!("{}({}{});", path.display(), section, wildcard));
                if !self.files_paths.contains(&path) {
                    self.files_paths.push(path);
                }
            }
            FileKind::Archive => {
                let mut path = base_path.to_path_buf();
                path.extend(&file.path);

                self.writeln(&format!(
                    "{}:{}({}{});",
                    path.display(),
                    file.subfile,
                    section,
                    wildcard
                ));
                if !self.files_paths.contains(&path) {
                    self.files_paths.push(path);
                }
            }
            FileKind::Pad => {
                if file.section == section {
                    self.writeln(&format!(". += 0x{:X};", file.pad_amount));
                }
            }
            FileKind::LinkerOffset => {
                if file.section == section {
                    self.write_symbol(&style.linker_offset(&file.linker_offset_name), ".");
                }
            }
            FileKind::Group => {
                let mut new_base_path = base_path.to_path_buf();

                new_base_path.extend(&file.dir);

                for file_of_group in &file.files {
                    self.emit_file(file_of_group, segment, section, &new_base_path);
                }
            }
        }
    }

    fn emit_section(&mut self, segment: &Segment, section: &str) {
        for file in &segment.files {
            if !file.section_order.is_empty() {
                // Keys specify the section and value specify where it will be put
                // For example: `section_order: { .data: .rodata }`, meaning the `.data` of the file should be put within its `.rodata`

                // This section should be placed somewhere else
                if file.section_order.contains_key(section) {
                    continue;
                }

                // Check if any other section should be placed be placed here
                for (k, v) in &file.section_order {
                    if v == section {
                        self.emit_file(file, segment, k, &self.settings.base_path);
                    }
                }
            }

            self.emit_file(file, segment, section, &self.settings.base_path);
        }
    }

    fn write_segment(
        &mut self,
        segment: &Segment,
        dotted_seg_name: &str,
        sections: &[String],
        noload: bool,
    ) {
        let style = &self.settings.linker_symbols_style;

        let seg_sym_suffix = if noload { "_noload" } else { "_alloc" };

        let seg_sym = format!("{}{}", segment.name, seg_sym_suffix);

        let seg_sym_start = style.segment_vram_start(&seg_sym);
        let seg_sym_end = style.segment_vram_end(&seg_sym);
        let seg_sym_size = style.segment_vram_size(&seg_sym);

        self.write_segment_start(segment, dotted_seg_name, noload, &seg_sym_start);

        if let Some(fill_value) = segment.fill_value {
            self.writeln(&format!("FILL(0x{:08X});", fill_value));
        }

        for (i, section) in sections.iter().enumerate() {
            let section_start_sym = style.segment_section_start(&segment.name, section);
            let section_end_sym = style.segment_section_end(&segment.name, section);
            let section_size_sym = style.segment_section_size(&segment.name, section);

            self.write_symbol(&section_start_sym, ".");

            self.emit_section(segment, section);

            if let Some(section_end_align) = segment.section_end_align {
                self.align_symbol(".", section_end_align);
            }
            self.write_sym_end_size(&section_start_sym, &section_end_sym, &section_size_sym, ".");

            if i + 1 < sections.len() {
                self.writeln("");
            }
        }

        self.write_segment_end(
            segment,
            dotted_seg_name,
            noload,
            &seg_sym_start,
            &seg_sym_end,
            &seg_sym_size,
        );
    }

    /*
    fn write_single_segment(
        &mut self,
        segment: &Segment,
        dotted_seg_name: &str,
        sections: &[String],
        noload: bool,
    ) {
        let style = &self.settings.linker_symbols_style;

        self.write_segment_start(segment, dotted_seg_name, noload, &seg_sym_start);

        if let Some(fill_value) = segment.fill_value {
            self.writeln(&format!("FILL(0x{:08X});", fill_value));
        }

        for (i, section) in sections.iter().enumerate() {
            let section_start_sym = style.segment_section_start(&segment.name, section);
            let section_end_sym = style.segment_section_end(&segment.name, section);
            let section_size_sym = style.segment_section_size(&segment.name, section);

            self.write_symbol(&section_start_sym, ".");

            self.emit_section(segment, section);

            if let Some(section_end_align) = segment.section_end_align {
                self.align_symbol(".", section_end_align);
            }
            self.write_sym_end_size(&section_start_sym, &section_end_sym, &section_size_sym, ".");

            if i + 1 < sections.len() {
                self.writeln("");
            }
        }

        self.write_segment_end(
            segment,
            dotted_seg_name,
            noload,
            &seg_sym_start,
            &seg_sym_end,
            &seg_sym_size,
        );
    }
    */
}
