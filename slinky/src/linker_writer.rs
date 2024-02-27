/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{
    collections::HashSet,
    fs::{self, File},
    io::Write,
    path::Path,
};

use crate::segment::Segment;
use crate::settings::Settings;
use crate::{file_kind::FileKind, SlinkyError};

pub struct LinkerWriter<'a> {
    pub linker_symbols: HashSet<String>,

    indent_level: i32,
    buffer: Vec<String>,

    settings: &'a Settings,
}

impl<'a> LinkerWriter<'a> {
    pub fn new(settings: &'a Settings) -> Self {
        Self {
            linker_symbols: HashSet::new(),
            indent_level: 0,
            buffer: Vec::new(),
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

    // TODO: figure out a better way to handle Options
    pub fn add_segment(&mut self, segment: &Segment) {
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
        // self.writeln(&format!("__romPos = ALIGN(__romPos, {});", ));
        self.write_sym_end_size(
            &main_seg_rom_sym_start,
            &main_seg_rom_sym_end,
            &main_seg_rom_sym_size,
            "__romPos",
        );

        self.writeln("");
    }

    pub fn save_linker_script(&self, path: &Path) -> Result<(), SlinkyError> {
        if let Some(parent) = path.parent() {
            if let Err(e) = fs::create_dir_all(parent) {
                return Err(SlinkyError::FailedDirCreate {
                    path: parent.to_path_buf(),
                    description: e.to_string(),
                });
            }
        }

        let mut f = match File::create(path) {
            Ok(f) => f,
            Err(e) => {
                return Err(SlinkyError::FailedFileOpen {
                    path: path.to_path_buf(),
                    description: e.to_string(),
                })
            }
        };

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

        self.linker_symbols.insert(value.to_string());
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

    fn write_files_for_section(&mut self, segment: &Segment, section: &str) {
        let style = &self.settings.linker_symbols_style;

        for file in &segment.files {
            let mut path = self.settings.base_path.clone();

            path.extend(&file.path);

            let wildcard = if segment.wildcard_sections { "*" } else { "" };

            // TODO: figure out glob support
            match file.kind {
                FileKind::Object => {
                    self.writeln(&format!("{}({}{});", path.display(), section, wildcard));
                }
                FileKind::Archive => {
                    self.writeln(&format!("{}:*({}{});", path.display(), section, wildcard));
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
            }
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

            self.write_files_for_section(segment, section);

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
}
