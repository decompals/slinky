use serde::Deserialize;

#[derive(Deserialize, PartialEq, Debug)]
pub struct Options {
    pub placeholder: Option<()>,
}

impl Options {
    pub fn new() -> Self {
        Self {
            placeholder: None,
        }
    }
}
