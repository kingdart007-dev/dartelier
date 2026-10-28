# Repository Foundation — Decision Record

Status: Proposed

## Initial direction

Start with one Flutter package named `dartelier`. Avoid a multi-package workspace until a real boundary requires it. Add a runnable example when the first meaningful public API exists.

## Quality baseline

Use Dart formatting, Flutter static analysis, automated tests, and a minimal GitHub Actions workflow. Do not claim checks passed until CI reports a successful run.

## SDK compatibility

Use the stable Flutter channel in CI. The minimum supported Flutter/Dart versions must be selected from verified release compatibility and documented before publishing. Revisit the lower bound when APIs or dependencies require it.

## License

Recommendation: MIT for a permissive, low-friction starting point. This is a licensing decision and should be confirmed before a public release.

## Acceptance

- Package metadata and a public entrypoint exist.
- Formatting, analysis, and tests are configured.
- CI runs those checks on pushes and pull requests.
- The README explains the actual current state.
- No design-system APIs are added during this foundation stage.
