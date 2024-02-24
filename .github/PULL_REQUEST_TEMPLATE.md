# Hello and thank you for contributing to slinky

Before opening your PR please make sure to do the following before:

- Write a message explaining your changes.
- Add an entry to [`CHANGELOG.md`](../CHANGELOG.md) about your changes (under
  the `Unreleased` category).
- Make sure `cargo test` passes locally.
- Run both `cargo clippy --fix` and `cargo fmt`.
- If this PR fixes an issue then add `fixes #issue_number` is the PR description.
  - This will close the issue when the PR is merged.
  - If it doesn't fix an issue but it is somewhat related to an issue/PR then
    mention the `#issue_number` on the PR description (without the `fixes`).
- Delete this line and everything above it.
