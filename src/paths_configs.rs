use std::path::PathBuf;
use serde::Deserialize;

#[derive(Deserialize, PartialEq, Debug)]
pub struct PathsConfigs {
    pub base_path: Option<PathBuf>,
}

impl PathsConfigs {
    pub fn new() -> Self {
        Self {
            base_path: None,
        }
    }
}
