/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

mod paths_configs;
mod options;
mod segment;
mod linker_writer;
mod segment_symbols_style;

use std::{fs, path::Path};
use serde_yaml::Value;
use serde::Deserialize;

use paths_configs::PathsConfigs;
use options::Options;
use segment::Segment;

use linker_writer::LinkerWriter;

fn main() {
    let yaml_contents = fs::read_to_string("test_case.yaml").expect("error");

    //println!("Hello, world!");

    let yaml_obj: Value = Value::deserialize(serde_yaml::Deserializer::from_str(&yaml_contents)).expect("invalid yaml");

    let yaml_root = yaml_obj.as_mapping().expect("Invalid yaml: Expected top-level `segments` list");

    let path_configs = match yaml_root.get("paths") {
        None => PathsConfigs::default(),
        Some(val) => serde_yaml::from_value(val.clone()).expect("Failed to parse top-level `paths`"),
    };
    let options = match yaml_root.get("options") {
        None => Options::default(),
        Some(val) => serde_yaml::from_value(val.clone()).expect("Failed to parse top-level `paths`"),
    };

    println!("{:?}", path_configs);
    println!("{:?}", options);

    let mut segments_list: Vec<Segment> = serde_yaml::from_value(yaml_root.get("segments").expect("Invalid yaml: Expected top-level `segments` list").clone()).expect("");
    for segment in &mut segments_list {
        segment.use_subalign = Some(options.use_subalign);
        segment.subalign = Some(options.subalign);

        segment.wildcard_sections = Some(options.wildcard_sections);
    }

    let mut writer = LinkerWriter::new();
    writer.begin_sections();
    for segment in &segments_list {
        writer.add_segment(segment, &options, &path_configs);
    }
    writer.end_sections();

    writer.save_linker_script(Path::new("test_case.ld")).expect("Error writing the linker script");
}
