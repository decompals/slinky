/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

pub(crate) struct ScriptBuffer {
    indent_level: i32,
    buffer: Vec<String>,

    linker_symbols: indexmap::IndexSet<String>,
}

impl ScriptBuffer {
    pub fn new() -> Self {
        Self {
            indent_level: 0,
            buffer: Vec::new(),

            linker_symbols: indexmap::IndexSet::new(),
        }
    }
}

impl ScriptBuffer {
    pub fn write_empty_line(&mut self) {
        self.buffer.push("".to_string());
    }

    pub fn writeln(&mut self, line: &str) {
        let mut temp = String::new();

        for _i in 0..self.indent_level {
            temp += "    ";
        }

        temp += line;
        self.buffer.push(temp);
    }

    pub fn begin_block(&mut self) {
        self.writeln("{");
        self.indent_level += 1;
    }

    pub fn end_block(&mut self) {
        assert!(self.indent_level > 0);
        self.indent_level -= 1;
        self.writeln("}");
    }

    pub fn write_linker_symbol(&mut self, symbol: &str, value: &str) {
        // TODO: check `symbol` is a valid C identifier

        self.write_symbol_assignment(symbol, value, false, false);

        self.linker_symbols.insert(symbol.to_string());
    }

    pub fn write_symbol_assignment(
        &mut self,
        symbol: &str,
        value: &str,
        provide: bool,
        hidden: bool,
    ) {
        let line = match (provide, hidden) {
            (true, true) => format!("PROVIDE_HIDDEN({} = {});", symbol, value),
            (true, false) => format!("PROVIDE({} = {});", symbol, value),
            (false, true) => format!("HIDDEN({} = {});", symbol, value),
            (false, false) => format!("{} = {};", symbol, value),
        };

        self.writeln(&line);
    }

    pub fn align_symbol(&mut self, symbol: &str, align_value: u32) {
        self.writeln(&format!(
            "{} = ALIGN({}, 0x{:X});",
            symbol, symbol, align_value
        ));
    }

    pub fn write_symbol_max_self(&mut self, symbol: &str, other_sym: &str) {
        self.writeln(&format!("{} = MAX({}, {});", symbol, symbol, other_sym));
    }

    pub fn write_assert(&mut self, cond: &str, error_msg: &str) {
        self.writeln(&format!("ASSERT({}, \"Error: {}\");", cond, error_msg));
    }

    pub fn write_required_symbol(&mut self, name: &str) {
        self.writeln(&format!("EXTERN({});", name));
        self.write_assert(
            &format!("DEFINED({})", name),
            &format!("Required symbol '{}' was not linked", name),
        );
    }
}

impl ScriptBuffer {
    pub fn finish(&mut self) {
        assert!(self.indent_level == 0);
    }
}

impl ScriptBuffer {
    #[must_use]
    pub fn get_buffer(&self) -> &[String] {
        &self.buffer
    }

    #[must_use]
    pub fn get_linker_symbols(&self) -> &indexmap::IndexSet<String> {
        &self.linker_symbols
    }

    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.buffer.is_empty()
    }
}
