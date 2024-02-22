/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{
    collections::HashSet,
    fs::{self, File},
    io::Write,
    path::{Path, PathBuf},
};

use crate::file_kind::FileKind;
use crate::settings::Settings;
use crate::segment::Segment;

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

        self.writeln("");
    }

    pub fn end_sections(&mut self) {
        self.end_block();
        assert!(self.indent_level == 0);
    }

    // TODO: figure out a better way to handle Options
    pub fn add_segment(&mut self, segment: &Segment) {
        let style = &self.settings.segment_symbols_style;
        let emitted_segment_name = format!(".{}", segment.name);

        // println!("Adding segment {}", emitted_segment_name);

        let rom_start_sym = style.segment_rom_start(&segment.name);
        self.write_symbol(&rom_start_sym, "__romPos");
        self.write_symbol(
            &style.segment_vram_start(&segment.name),
            &format!("ADDR({})", emitted_segment_name),
        );

        self.write_segment_start(segment, &emitted_segment_name, false);
        // TODO: FILL()

        for section in &self.settings.alloc_sections {
            let section_start_sym = style.segment_section_start(&segment.name, section);
            let section_end_sym = style.segment_section_end(&segment.name, section);
            let section_size_sym = style.segment_section_size(&segment.name, section);

            self.write_symbol(&section_start_sym, ".");

            self.write_files_for_section(segment, section);

            self.write_symbol(&section_end_sym, ".");
            self.write_symbol(
                &section_size_sym,
                &format!("ABSOLUTE({} - {})", section_end_sym, section_start_sym),
            );
        }

        self.write_segment_end(segment, &emitted_segment_name, false);

        self.write_segment_start(segment, &emitted_segment_name, true);
        {
            let section_start_sym = style.segment_section_start(&segment.name, ".bss");
            let section_end_sym = style.segment_section_end(&segment.name, ".bss");
            let section_size_sym = style.segment_section_size(&segment.name, ".bss");

            self.write_symbol(&section_start_sym, ".");
            for section in &self.settings.noload_sections {
                self.write_files_for_section(segment, section);
            }
            self.write_symbol(&section_end_sym, ".");
            self.write_symbol(
                &section_size_sym,
                &format!("ABSOLUTE({} - {})", section_end_sym, section_start_sym),
            );
        }
        self.write_segment_end(segment, &emitted_segment_name, true);

        self.write_symbol(&style.segment_vram_end(&segment.name), ".");

        self.writeln("");
    }

    pub fn save_linker_script(&self, path: &Path) -> Result<(), std::io::Error> {
        match path.parent() {
            None => {}
            Some(parent) => fs::create_dir_all(parent)?,
        }

        let mut f = File::create(path)?;

        for line in &self.buffer {
            writeln!(f, "{}", line)?;
        }

        Ok(())
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
        self.writeln(&format!("{} = {};", symbol, value));

        self.linker_symbols.insert(value.to_string());
    }

    fn write_segment_start(&mut self, segment: &Segment, emitted_segment_name: &str, noload: bool) {
        let style = &self.settings.segment_symbols_style;

        let name_suffix = if noload { "_bss" } else { "" };
        let mut line = format!("{}{}", emitted_segment_name, name_suffix);

        if noload {
            line += " (NOLOAD) :";
        } else {
            if let Some(fixed_vram) = segment.fixed_vram {
                line += &format!(" 0x{:08X}", fixed_vram);
            }

            line += &format!(" : AT({})", style.segment_rom_start(&segment.name));
        }

        if segment.use_subalign.unwrap() {
            line += &format!(" SUBALIGN({})", segment.subalign.unwrap());
        }

        self.writeln(&line);
        self.begin_block();
    }

    fn write_segment_end(&mut self, segment: &Segment, emitted_segment_name: &str, noload: bool) {
        let style = &self.settings.segment_symbols_style;

        self.end_block();
        if !noload {
            self.writeln(&format!("__romPos += SIZEOF({});", emitted_segment_name));
            // self.writeln(&format!("__romPos = ALIGN(__romPos, {});", ));
            self.write_symbol(&style.segment_rom_end(&segment.name), "__romPos");
        }
    }

    fn write_files_for_section(&mut self, segment: &Segment, section: &str) {
        for file in &segment.files {
            let mut path = PathBuf::new();

            if let Some(base_path) = &self.settings.paths.base_path {
                path.extend(base_path);
            }

            path.extend(&file.path);

            let wildcard = if segment.wildcard_sections.unwrap() {
                "*"
            } else {
                ""
            };

            // TODO: figure out glob support
            match file.kind {
                FileKind::Object => {
                    self.writeln(&format!("{}({}{});", path.display(), section, wildcard));
                }
                FileKind::Archive => todo!(),
            }
        }
    }
}
