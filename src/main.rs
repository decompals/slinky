mod paths_configs;
mod options;
mod segment;

use std::fs;
use serde_yaml::Value;
use serde::Deserialize;

use paths_configs::PathsConfigs;
use options::Options;
use segment::Segment;

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

    let segments_list: Vec<Segment> = serde_yaml::from_value(yaml_root.get("segments").expect("Invalid yaml: Expected top-level `segments` list").clone()).expect("");
    for segment in &segments_list {
        println!("{:?}", segment);
    }
}
