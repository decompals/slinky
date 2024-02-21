use std::{fs, path::PathBuf};
use serde::{Deserialize};

#[derive(Deserialize, PartialEq, Debug)]
pub struct FileInfo {
    pub path: PathBuf,
}

#[derive(Deserialize, PartialEq, Debug)]
pub struct Segment {
    pub name: String,
    pub fixed_vram: Option<u64>,
    pub files: Vec<FileInfo>,
}
