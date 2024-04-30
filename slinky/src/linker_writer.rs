/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::PathBuf;
use std::{io::Write, path::Path};

use crate::{file_kind::FileKind, SlinkyError};
use crate::{utils, Document, VramClass};
use crate::{FileInfo, Segment};

use crate::script_buffer::ScriptBuffer;

pub struct LinkerWriter<'a> {
    buffer: ScriptBuffer,

    // Used for dependency generation
    files_paths: indexmap::IndexSet<PathBuf>,

    vram_classes: indexmap::IndexMap<String, VramClass>,

    single_segment: bool,
    reference_partial_objects: bool,

    /* Options to control stuff */
    emit_sections_kind_symbols: bool,
    emit_section_symbols: bool,

    d: &'a Document,
}

impl<'a> LinkerWriter<'a> {
    pub fn new(d: &'a Document) -> Self {
        let mut vram_classes = indexmap::IndexMap::with_capacity(d.vram_classes.len());
        for vram_class in &d.vram_classes {
            vram_classes.insert(vram_class.name.clone(), vram_class.clone());
        }

        Self {
            buffer: ScriptBuffer::new(),

            files_paths: indexmap::IndexSet::new(),

            vram_classes,

            single_segment: false,
            reference_partial_objects: false,

            emit_sections_kind_symbols: true,
            emit_section_symbols: true,

            d,
        }
    }

    pub fn new_reference_partial_objects(d: &'a Document) -> Self {
        let mut s = Self::new(d);

        s.reference_partial_objects = true;

        s
    }

    pub fn add_all_segments(&mut self, segments: &[Segment]) {
        if self.d.settings.single_segment_mode {
            assert!(segments.len() == 1);

            self.add_single_segment(&segments[0]);
        } else {
            self.begin_sections();
            for segment in segments {
                self.add_segment(segment);
            }
            self.end_sections();
        }
    }

    pub fn begin_sections(&mut self) {
        self.buffer.writeln("SECTIONS");
        self.buffer.begin_block();

        self.buffer.writeln("__romPos = 0x0;");

        if let Some(hardcoded_gp_value) = self.d.settings.hardcoded_gp_value {
            self.buffer
                .writeln(&format!("_gp = 0x{:08X};", hardcoded_gp_value));
        }

        self.buffer.write_empty_line();
    }

    pub fn end_sections(&mut self) {
        let style = &self.d.settings.linker_symbols_style;
        let mut need_ln = false;

        for (vram_class_name, vram_class) in &self.vram_classes {
            if !vram_class.emitted {
                continue;
            }

            self.buffer.write_symbol(
                &style.vram_class_size(vram_class_name),
                &format!(
                    "{} - {}",
                    style.vram_class_end(vram_class_name),
                    style.vram_class_start(vram_class_name),
                ),
            );

            need_ln = true;
        }

        if !self.d.settings.sections_allowlist.is_empty() {
            if need_ln {
                self.buffer.write_empty_line();
            }

            let address = " 0";

            for sect in &self.d.settings.sections_allowlist {
                self.buffer.writeln(&format!("{}{} :", sect, address));
                self.buffer.begin_block();

                self.buffer.writeln(&format!("*({});", sect));

                self.buffer.end_block();
            }

            need_ln = true;
        }

        if !self.d.settings.sections_allowlist_extra.is_empty() {
            if need_ln {
                self.buffer.write_empty_line();
            }

            let address = " 0";

            for sect in &self.d.settings.sections_allowlist_extra {
                self.buffer.writeln(&format!("{}{} :", sect, address));
                self.buffer.begin_block();

                self.buffer.writeln(&format!("*({});", sect));

                self.buffer.end_block();
            }

            need_ln = true;
        }

        if self.d.settings.discard_wildcard_section || !self.d.settings.sections_denylist.is_empty()
        {
            if need_ln {
                self.buffer.write_empty_line();
            }

            self.buffer.writeln("/DISCARD/ :");
            self.buffer.begin_block();

            for sect in &self.d.settings.sections_denylist {
                self.buffer.writeln(&format!("*({});", sect));
            }

            if self.d.settings.discard_wildcard_section {
                self.buffer.writeln("*(*);")
            }

            self.buffer.end_block();
        }

        self.buffer.end_block();
        self.buffer.finish();
    }

    pub fn add_segment(&mut self, segment: &Segment) {
        assert!(!self.single_segment);

        let style = &self.d.settings.linker_symbols_style;

        // rom segment symbols
        let main_seg_rom_sym_start: String = style.segment_rom_start(&segment.name);
        let main_seg_rom_sym_end: String = style.segment_rom_end(&segment.name);
        let main_seg_rom_sym_size: String = style.segment_rom_size(&segment.name);

        // vram segment symbols
        let main_seg_sym_start: String = style.segment_vram_start(&segment.name);
        let main_seg_sym_end: String = style.segment_vram_end(&segment.name);
        let main_seg_sym_size: String = style.segment_vram_size(&segment.name);

        if let Some(vram_class_name) = &segment.vram_class {
            // TODO: return Err if vram class is not present instead of unwrapping
            let vram_class = self.vram_classes.get_mut(vram_class_name).unwrap();

            if !vram_class.emitted {
                let vram_class_sym = style.vram_class_start(vram_class_name);

                if let Some(fixed_vram) = vram_class.fixed_vram {
                    self.buffer
                        .write_symbol(&vram_class_sym, &format!("0x{:08X}", fixed_vram));
                } else if let Some(fixed_symbol) = &vram_class.fixed_symbol {
                    self.buffer.write_symbol(&vram_class_sym, fixed_symbol);
                } else {
                    self.buffer.write_symbol(&vram_class_sym, "0x00000000");
                    for other_class_name in &vram_class.follows_classes {
                        self.buffer.write_symbol_max_self(
                            &vram_class_sym,
                            &style.vram_class_end(other_class_name),
                        );
                    }
                }
                self.buffer
                    .write_symbol(&style.vram_class_end(vram_class_name), "0x00000000");

                self.buffer.write_empty_line();

                vram_class.emitted = true;
            }
        }

        if let Some(segment_start_align) = segment.segment_start_align {
            self.buffer.align_symbol("__romPos", segment_start_align);
            self.buffer.align_symbol(".", segment_start_align);
        }

        self.buffer
            .write_symbol(&main_seg_rom_sym_start, "__romPos");
        self.buffer
            .write_symbol(&main_seg_sym_start, &format!("ADDR(.{})", segment.name));

        // Emit alloc segment
        self.write_segment(segment, &segment.alloc_sections, false);

        self.buffer.write_empty_line();

        // Emit noload segment
        self.write_segment(segment, &segment.noload_sections, true);

        self.write_sym_end_size(
            &main_seg_sym_start,
            &main_seg_sym_end,
            &main_seg_sym_size,
            ".",
        );

        self.buffer
            .writeln(&format!("__romPos += SIZEOF(.{});", segment.name));
        self.write_sym_end_size(
            &main_seg_rom_sym_start,
            &main_seg_rom_sym_end,
            &main_seg_rom_sym_size,
            "__romPos",
        );

        if let Some(vram_class_name) = &segment.vram_class {
            self.buffer.write_empty_line();

            let vram_class_sym_end = style.vram_class_end(vram_class_name);
            self.buffer
                .write_symbol_max_self(&vram_class_sym_end, &main_seg_sym_end);
        }

        self.buffer.write_empty_line();
    }

    pub fn add_single_segment(&mut self, segment: &Segment) {
        assert!(self.buffer.is_empty());

        // Make sure this function is called only once
        assert!(!self.single_segment);
        self.single_segment = true;

        self.buffer.writeln("SECTIONS");
        self.buffer.begin_block();

        if let Some(fixed_vram) = segment.fixed_vram {
            self.buffer.writeln(&format!(". = 0x{:08X};", fixed_vram));
            self.buffer.write_empty_line();
        }

        // Emit alloc segment
        self.write_single_segment(segment, &segment.alloc_sections, false);

        self.buffer.write_empty_line();

        // Emit noload segment
        self.write_single_segment(segment, &segment.noload_sections, true);

        self.buffer.write_empty_line();

        self.end_sections();
    }
}

impl LinkerWriter<'_> {
    pub fn export_linker_script(&self, dst: &mut impl Write) -> Result<(), SlinkyError> {
        for line in self.buffer.get_buffer() {
            if let Err(e) = writeln!(dst, "{}", line) {
                return Err(SlinkyError::FailedWrite {
                    description: e.to_string(),
                    contents: line.into(),
                });
            }
        }

        Ok(())
    }

    pub fn export_linker_script_to_file(&self, path: &Path) -> Result<(), SlinkyError> {
        let mut f = utils::create_file_and_parents(path)?;

        self.export_linker_script(&mut f)
    }

    pub fn export_linker_script_to_string(&self) -> Result<String, SlinkyError> {
        let mut s = Vec::new();

        self.export_linker_script(&mut s)?;

        match String::from_utf8(s) {
            Err(e) => Err(SlinkyError::FailedStringConversion {
                description: e.to_string(),
            }),
            Ok(ret) => Ok(ret),
        }
    }
}

impl LinkerWriter<'_> {
    pub fn export_dependencies_file(
        &self,
        dst: &mut impl Write,
        target_path: &Path,
    ) -> Result<(), SlinkyError> {
        if let Err(e) = write!(dst, "{}:", target_path.display()) {
            return Err(SlinkyError::FailedWrite {
                description: e.to_string(),
                contents: target_path.display().to_string(),
            });
        }

        for p in &self.files_paths {
            if let Err(e) = write!(dst, " \\\n    {}", p.display()) {
                return Err(SlinkyError::FailedWrite {
                    description: e.to_string(),
                    contents: p.display().to_string(),
                });
            }
        }

        if let Err(e) = write!(dst, "\n\n") {
            return Err(SlinkyError::FailedWrite {
                description: e.to_string(),
                contents: "".to_string(),
            });
        }

        for p in &self.files_paths {
            if let Err(e) = writeln!(dst, "{}:", p.display()) {
                return Err(SlinkyError::FailedWrite {
                    description: e.to_string(),
                    contents: p.display().to_string(),
                });
            }
        }

        Ok(())
    }

    pub fn export_dependencies_file_to_file(
        &self,
        path: &Path,
        target_path: &Path,
    ) -> Result<(), SlinkyError> {
        let mut f = utils::create_file_and_parents(path)?;

        self.export_dependencies_file(&mut f, target_path)
    }

    pub fn export_dependencies_file_to_string(
        &self,
        target_path: &Path,
    ) -> Result<String, SlinkyError> {
        let mut s = Vec::new();

        self.export_dependencies_file(&mut s, target_path)?;

        match String::from_utf8(s) {
            Err(e) => Err(SlinkyError::FailedStringConversion {
                description: e.to_string(),
            }),
            Ok(ret) => Ok(ret),
        }
    }
}

impl LinkerWriter<'_> {
    pub fn export_symbol_header(&self, dst: &mut impl Write) -> Result<(), SlinkyError> {
        if let Err(e) = write!(
            dst,
            "#ifndef HEADER_SYMBOLS_H\n#define HEADER_SYMBOLS_H\n\n"
        ) {
            return Err(SlinkyError::FailedWrite {
                description: e.to_string(),
                contents: "".into(),
            });
        }

        let arr_suffix = if self.d.settings.symbols_header_as_array {
            "[]"
        } else {
            ""
        };

        for sym in self.get_linker_symbols() {
            if let Err(e) = writeln!(
                dst,
                "extern {} {}{};",
                self.d.settings.symbols_header_type, sym, arr_suffix
            ) {
                return Err(SlinkyError::FailedWrite {
                    description: e.to_string(),
                    contents: sym.into(),
                });
            }
        }

        if let Err(e) = write!(dst, "\n#endif\n") {
            return Err(SlinkyError::FailedWrite {
                description: e.to_string(),
                contents: "".into(),
            });
        }

        Ok(())
    }

    pub fn export_symbol_header_to_file(&self, path: &Path) -> Result<(), SlinkyError> {
        let mut f = utils::create_file_and_parents(path)?;

        self.export_symbol_header(&mut f)
    }

    pub fn export_symbol_header_to_string(&self) -> Result<String, SlinkyError> {
        let mut s = Vec::new();

        self.export_symbol_header(&mut s)?;

        match String::from_utf8(s) {
            Err(e) => Err(SlinkyError::FailedStringConversion {
                description: e.to_string(),
            }),
            Ok(ret) => Ok(ret),
        }
    }
}

impl LinkerWriter<'_> {
    pub fn save_other_files(&self) -> Result<(), SlinkyError> {
        if let Some(d_path) = &self.d.settings.d_path {
            if let Some(target_path) = &self.d.settings.target_path {
                self.export_dependencies_file_to_file(d_path, target_path)?;
            }
        }

        if let Some(symbols_header_path) = &self.d.settings.symbols_header_path {
            self.export_symbol_header_to_file(symbols_header_path)?;
        }

        Ok(())
    }
}

// Getters / Setters
impl LinkerWriter<'_> {
    #[must_use]
    pub fn get_linker_symbols(&self) -> &indexmap::IndexSet<String> {
        self.buffer.get_linker_symbols()
    }

    pub fn set_emit_sections_kind_symbols(&mut self, value: bool) {
        self.emit_sections_kind_symbols = value;
    }

    #[must_use]
    pub fn get_emit_sections_kind_symbols(&mut self) -> bool {
        self.emit_sections_kind_symbols
    }

    pub fn set_emit_section_symbols(&mut self, value: bool) {
        self.emit_section_symbols = value;
    }

    #[must_use]
    pub fn get_emit_section_symbols(&mut self) -> bool {
        self.emit_section_symbols
    }
}

// internal functions
impl LinkerWriter<'_> {
    fn write_sym_end_size(&mut self, start: &str, end: &str, size: &str, value: &str) {
        self.buffer.write_symbol(end, value);

        self.buffer
            .write_symbol(size, &format!("ABSOLUTE({} - {})", end, start));
    }

    fn write_sections_kind_start(&mut self, segment: &Segment, noload: bool) {
        if self.emit_sections_kind_symbols {
            let style = &self.d.settings.linker_symbols_style;

            let seg_sym_suffix = if noload { "noload" } else { "alloc" };
            let seg_sym = format!("{}_{}", segment.name, seg_sym_suffix);

            let seg_sym_start = style.segment_vram_start(&seg_sym);

            self.buffer.write_symbol(&seg_sym_start, ".");

            self.buffer.write_empty_line();
        }
    }

    fn write_sections_kind_end(&mut self, segment: &Segment, noload: bool) {
        if self.emit_sections_kind_symbols {
            self.buffer.write_empty_line();

            let style = &self.d.settings.linker_symbols_style;

            let seg_sym_suffix = if noload { "noload" } else { "alloc" };
            let seg_sym = format!("{}_{}", segment.name, seg_sym_suffix);

            let seg_sym_start = style.segment_vram_start(&seg_sym);
            let seg_sym_end = style.segment_vram_end(&seg_sym);
            let seg_sym_size = style.segment_vram_size(&seg_sym);

            self.write_sym_end_size(&seg_sym_start, &seg_sym_end, &seg_sym_size, ".");
        }
    }

    fn write_section_symbol_start(&mut self, segment: &Segment, section: &str) {
        if self.emit_section_symbols {
            let style = &self.d.settings.linker_symbols_style;

            let section_start_sym = style.segment_section_start(&segment.name, section);

            self.buffer.write_symbol(&section_start_sym, ".");
        }
    }

    fn write_section_symbol_end(&mut self, segment: &Segment, section: &str) {
        if self.emit_section_symbols {
            if let Some(section_end_align) = segment.section_end_align {
                self.buffer.align_symbol(".", section_end_align);
            }

            let style = &self.d.settings.linker_symbols_style;

            let section_start_sym = style.segment_section_start(&segment.name, section);
            let section_end_sym = style.segment_section_end(&segment.name, section);
            let section_size_sym = style.segment_section_size(&segment.name, section);

            self.write_sym_end_size(&section_start_sym, &section_end_sym, &section_size_sym, ".");
        }
    }

    fn write_segment_start(&mut self, segment: &Segment, noload: bool) {
        let style = &self.d.settings.linker_symbols_style;

        self.write_sections_kind_start(segment, noload);

        let name_suffix = if noload { ".noload" } else { "" };
        let mut line = format!(".{}{}", segment.name, name_suffix);

        if noload {
            line += " (NOLOAD) :";
        } else {
            if let Some(fixed_vram) = segment.fixed_vram {
                line += &format!(" 0x{:08X}", fixed_vram);
            } else if let Some(fixed_symbol) = &segment.fixed_symbol {
                line += &format!(" {}", fixed_symbol);
            } else if let Some(follows_segment) = &segment.follows_segment {
                line += &format!(" {}", style.segment_vram_end(follows_segment));
            } else if let Some(vram_class) = &segment.vram_class {
                line += &format!(" {}", style.vram_class_start(vram_class));
            }

            line += &format!(" : AT({})", style.segment_rom_start(&segment.name));
        }

        if let Some(subalign) = segment.subalign {
            line += &format!(" SUBALIGN({})", subalign);
        }

        self.buffer.writeln(&line);
        self.buffer.begin_block();
    }

    fn write_segment_end(&mut self, segment: &Segment, noload: bool) {
        self.buffer.end_block();

        self.write_sections_kind_end(segment, noload);
    }

    fn emit_file(&mut self, file: &FileInfo, segment: &Segment, section: &str, base_path: &Path) {
        let style = &self.d.settings.linker_symbols_style;

        let wildcard = if segment.wildcard_sections { "*" } else { "" };

        // TODO: figure out glob support
        match file.kind {
            FileKind::Object => {
                let mut path = base_path.to_path_buf();
                path.extend(&file.path);

                self.buffer
                    .writeln(&format!("{}({}{});", path.display(), section, wildcard));
                if !self.files_paths.contains(&path) {
                    self.files_paths.insert(path);
                }
            }
            FileKind::Archive => {
                let mut path = base_path.to_path_buf();
                path.extend(&file.path);

                self.buffer.writeln(&format!(
                    "{}:{}({}{});",
                    path.display(),
                    file.subfile,
                    section,
                    wildcard
                ));
                if !self.files_paths.contains(&path) {
                    self.files_paths.insert(path);
                }
            }
            FileKind::Pad => {
                if file.section == section {
                    self.buffer
                        .writeln(&format!(". += 0x{:X};", file.pad_amount));
                }
            }
            FileKind::LinkerOffset => {
                if file.section == section {
                    self.buffer
                        .write_symbol(&style.linker_offset(&file.linker_offset_name), ".");
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
        let mut base_path = PathBuf::new();

        base_path.extend(&self.d.settings.base_path);
        if !self.reference_partial_objects {
            base_path.extend(&segment.dir);
        }

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
                        self.emit_file(file, segment, k, &base_path);
                    }
                }
            }

            self.emit_file(file, segment, section, &base_path);
        }
    }

    fn write_segment(&mut self, segment: &Segment, sections: &[String], noload: bool) {
        self.write_segment_start(segment, noload);

        if let Some(fill_value) = segment.fill_value {
            self.buffer.writeln(&format!("FILL(0x{:08X});", fill_value));
        }

        for (i, section) in sections.iter().enumerate() {
            self.write_section_symbol_start(segment, section);

            self.emit_section(segment, section);

            self.write_section_symbol_end(segment, section);

            if i + 1 < sections.len() {
                self.buffer.write_empty_line();
            }
        }

        self.write_segment_end(segment, noload);
    }

    fn write_single_segment(&mut self, segment: &Segment, sections: &[String], noload: bool) {
        self.write_sections_kind_start(segment, noload);

        for (i, section) in sections.iter().enumerate() {
            let mut line = String::new();

            self.write_section_symbol_start(segment, section);

            line += &format!("{}{} :", section, if noload { " (NOLOAD)" } else { "" });

            if let Some(subalign) = segment.subalign {
                line += &format!(" SUBALIGN({})", subalign);
            }

            self.buffer.writeln(&line);
            self.buffer.begin_block();

            if let Some(fill_value) = segment.fill_value {
                self.buffer.writeln(&format!("FILL(0x{:08X});", fill_value));
            }

            self.emit_section(segment, section);

            self.buffer.end_block();
            self.write_section_symbol_end(segment, section);

            if i + 1 < sections.len() {
                self.buffer.write_empty_line();
            }
        }

        self.write_sections_kind_end(segment, noload);
    }
}
