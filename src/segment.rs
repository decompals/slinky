use std::path::PathBuf;
use serde::Deserialize;

#[derive(Deserialize, PartialEq, Debug)]
pub enum FileKind {
    Object,
    Archive,
}

#[derive(Deserialize, PartialEq, Debug)]
pub struct FileInfo {
    pub path: PathBuf,
    pub kind: Option<FileKind>,
}

#[derive(Deserialize, PartialEq, Debug)]
pub struct Segment {
    pub name: String,
    pub fixed_vram: Option<u64>,
    pub subalign: Option<u64>,
    pub files: Vec<FileInfo>,
}
