# Repository Foundation — Decision Record

Status: Adopted for the initial implementation; validation is ongoing.

## Package structure

Start with one Flutter package named dartelier. Avoid a multi-package workspace until a real boundary requires it. Add a runnable example when a meaningful public API needs an interactive demonstration.

## SDK support

- Minimum declared Flutter: 3.47.0.
- Minimum declared Dart: 3.13.0.
- CI currently checks Flutter 3.47.8.
- Compatibility is not considered verified until CI passes.

The declared SDK lower bound should be updated only alongside an actual compatibility check. Flutter's official release archive documents stable releases and paired Dart versions: https://docs.flutter.dev/install/archive.

## Quality baseline

Use Dart formatting, Flutter static analysis, automated tests, and a minimal GitHub Actions workflow. Do not claim checks passed until CI reports success.

## License

MIT is selected as the initial permissive license. Review licensing before accepting third-party contributions or publishing a package.

## Acceptance

- Package metadata and public entrypoint exist.
- Formatting, analysis, and tests are configured.
- CI checks the declared supported version.
- README reflects the actual state.
- Public APIs have focused tests and documentation.
