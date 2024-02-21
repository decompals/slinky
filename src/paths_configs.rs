use std::path::PathBuf;
use serde::Deserialize;

#[derive(Deserialize, PartialEq, Debug)]
#[serde(default)]
pub struct PathsConfigs {
    pub base_path: Option<PathBuf>,
}

impl Default for PathsConfigs {
    fn default() -> Self {
        Self {
            base_path: None,
        }
    }
}
