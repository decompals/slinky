mod segment;

use std::{fs, path::PathBuf};
use serde_yaml::Value;
use serde::{Deserialize};
use segment::Segment;

pub struct PathsConfigs {
    pub base_path: Option<PathBuf>,
}

impl PathsConfigs {
    pub fn new() -> Self {
        Self {
            base_path: None,
        }
    }

    pub fn parse_yaml_element(&mut self, yaml_element: Option<&Value>) {
        let yaml_paths = match yaml_element {
            None => return,
            Some(yaml_paths_val) => {
                if yaml_paths_val.is_null() {
                    return;
                }
                yaml_paths_val.as_mapping().expect("Invalid yaml: top-level `paths` must be a mapping")
            },
        };

        match yaml_paths.get("base_path") {
            None => (),
            Some(base_path_val) => self.base_path = Some(base_path_val.as_str().expect("Invalid yaml: Invalid `base_path`").into()),
        }
    }
}

struct Options {
    pub placeholder: Option<()>,
}

impl Options {
    pub fn new() -> Self {
        Self {
            placeholder: None,
        }
    }

    pub fn parse_yaml_element(&mut self, yaml_element: Option<&Value>) {
        let _yaml_options = match yaml_element {
            None => return,
            Some(yaml_paths_val) => {
                if yaml_paths_val.is_null() {
                    return;
                }
             yaml_paths_val.as_mapping().expect("Invalid yaml: top-level `options` must be a mapping")
            },
        };
    }
}

fn main() {
    let mut path_configs  = PathsConfigs::new();
    let mut options = Options::new();

    let yaml_contents = fs::read_to_string("test_case.yaml").expect("error");

    //println!("Hello, world!");

    let yaml_obj: Value = Value::deserialize(serde_yaml::Deserializer::from_str(&yaml_contents)).expect("invalid yaml");

    let yaml_root = yaml_obj.as_mapping().expect("Invalid yaml: Expected top-level `segments` list");

    path_configs.parse_yaml_element(yaml_root.get("paths"));
    options.parse_yaml_element(yaml_root.get("options"));

    /*
    let yaml_segments_vec = yaml_root.get("segments").expect("Invalid yaml: Expected top-level `segments` list").as_sequence().expect("Invalid yaml: Expected top-level `segments` to be a list");
    for val in yaml_segments_vec {
        // TODO: no clone?
        let segment: Segment = serde_yaml::from_value(val.clone()).expect("");
    }
    */
    let segments_list: Vec<Segment> = serde_yaml::from_value(yaml_root.get("segments").expect("Invalid yaml: Expected top-level `segments` list").clone()).expect("");

    for segment in &segments_list {
        println!("{:?}", segment);
    }
}
