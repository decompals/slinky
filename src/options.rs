use serde::Deserialize;

#[derive(Deserialize, PartialEq, Debug)]
#[serde(default)]
pub struct Options {
    pub subalign: Option<u64>,
    pub placeholder: Option<u64>,
}

impl Default for Options {
    fn default() -> Self {
        Self {
            subalign: Some(16),
            placeholder: None,
        }
    }
}
