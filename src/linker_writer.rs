use std::{collections::HashSet, fs::{self, File}, io::Write, path::{Path, PathBuf}};

use crate::{paths_configs::PathsConfigs, segment::{FileKind, Segment}};
use crate::options::Options;

pub struct LinkerWriter {
    pub linker_symbols: HashSet<String>,

    indent_level: i32,
    buffer: Vec<String>,
}

impl LinkerWriter {
    pub fn new() -> Self {
        Self {
            linker_symbols: HashSet::new(),
            indent_level: 0,
            buffer:Vec::new(),
        }
    }

    pub fn begin_sections(&mut self) {
        self.writeln("SECTIONS");
        self.begin_block();
        self.writeln("__romPos = 0;")
    }

    pub fn end_sections(&mut self) {
        self.end_block();
        assert!(self.indent_level == 0);
    }

    // TODO: figure out a better way to handle Options
    pub fn add_segment(&mut self, segment: &Segment, options: &Options, paths_configs: &PathsConfigs) {
        let style = &options.segment_symbols_style;
        let segment_name = format!(".{}", segment.name);

        // println!("Adding segment {}", segment_name);

        let rom_start_sym = style.segment_rom_start(&segment.name);
        let rom_end_sym = style.segment_rom_end(&segment.name);
        self.write_symbol(&rom_start_sym, "__romPos");
        self.write_symbol(&style.segment_vram_start(&segment.name), &format!("ADDR({})", segment_name));

        {
            let mut line = segment_name.clone();

            if let Some(fixed_vram) = segment.fixed_vram {
                line += &format!(" {:08X}", fixed_vram);
            }

            line += &format!(" AT({})", rom_start_sym);

            if let Some(subalign) = segment.subalign {
                line += &format!(" SUBALIGN({})", subalign);
            }

            self.writeln(&line);
        }

        self.begin_block();

        // TODO: FILL()

        for section in &options.alloc_sections {
            let section_start_sym = style.segment_section_start(&segment.name, section);
            let section_end_sym = style.segment_section_end(&segment.name, section);
            let section_size_sym = style.segment_section_size(&segment.name, section);

            self.write_symbol(&section_start_sym, ".");
            for file in &segment.files {
                let mut path = PathBuf::new();

                if let Some(base_path) = &paths_configs.base_path {
                    path.extend(base_path);
                }

                path.extend(&file.path);

                match file.kind {
                    FileKind::Object => {
                        self.writeln(&format!("{}({});", path.display(), section));
                    },
                    FileKind::Archive => todo!(),
                }

            }
            self.write_symbol(&section_end_sym, ".");
            self.write_symbol(&section_size_sym, &format!("ABSOLUTE({} - {})", section_end_sym, section_start_sym));
        }
        self.end_block();

        self.writeln(&format!("__romPos += SIZEOF({});", segment_name));
        // self.writeln(&format!("__romPos = ALIGN(__romPos, {});", ));
        self.write_symbol(&rom_end_sym, "__romPos");

        self.writeln("");
    }


    pub fn save_linker_script(&self, path: &Path) -> Result<(), std::io::Error> {
        match path.parent() {
            None => {},
            Some(parent) => fs::create_dir_all(parent)?,
        }

        let mut f = File::create(path)?;

        for line in &self.buffer {
            write!(f, "{}\n", line)?;
        }

        Ok(())
    }
}

// internal functions
impl LinkerWriter {
    fn writeln(&mut self, line: &str) {
        if line.len() == 0 {
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
}
