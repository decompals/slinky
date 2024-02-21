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

    #[serde(default="default_fileinfo_kind")]
    pub kind: FileKind,
}

fn default_fileinfo_kind() -> FileKind {
    FileKind::Object
}

#[derive(Deserialize, PartialEq, Debug)]
pub struct Segment {
    pub name: String,
    pub fixed_vram: Option<u64>,
    //#[serde(default="default_segment_subalign")]
    pub subalign: Option<i64>,
    pub files: Vec<FileInfo>,
    // TODO: section_order (both alloc and noload)
}

//fn default_segment_subalign() -> Option<i64> {
//    // TODO: somehow grab the value from Options?
//    Some(-1)
//}
