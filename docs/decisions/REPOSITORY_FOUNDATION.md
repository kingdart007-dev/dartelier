# Repository Foundation — Decision Record

Status: Adopted for the initial implementation; validation is ongoing.

## Package structure

Start with one Flutter package named `dartelier`. Avoid a multi-package workspace until a real boundary requires it. Add a runnable example when a meaningful public API needs an interactive demonstration.

## SDK support

- Minimum declared Flutter: 3.38.0.
- Minimum declared Dart: 3.10.0, paired with Flutter 3.38.0.
- CI checks Flutter 3.38.0 and the current stable channel.
- The declared lower bound is a compatibility target, not a verified claim until the 3.38.0 CI job passes.

The Flutter release archive documents stable releases and their paired Dart versions: https://docs.flutter.dev/install/archive.

## Quality baseline

Use Dart formatting, Flutter static analysis, automated tests, and a minimal GitHub Actions workflow. Do not claim checks passed until CI reports success for both matrix entries.

## License

MIT is selected as the initial permissive license. Review licensing before accepting third-party contributions or publishing a package.

## Acceptance

- Package metadata and public entrypoint exist.
- Formatting, analysis, and tests are configured.
- CI checks the minimum supported version and current stable.
- README reflects the actual state.
- No design-system APIs beyond the first tested foundations are added without review.
