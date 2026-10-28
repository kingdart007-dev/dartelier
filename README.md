# Dartelier

**A thoughtfully engineered Flutter UI system and toolkit for building maintainable mobile apps.**

Dartelier aims to make Flutter development more consistent and approachable—from reusable design foundations for experienced engineers to better-guided workflows for newer developers. Implementation is incremental: we validate foundations before expanding into a large component catalogue or visual app builder.

## Principles

- Craft over feature count; each public feature solves a real problem.
- Customization without fragility: useful defaults and deliberate extension points.
- Simple before clever; no abstraction or dependency without a reason.
- Accessibility and platform awareness, including text scaling, semantics, motion, and RTL.
- Honest reporting of planned, implemented, and verified work.
- Small, reviewable changes with explicit acceptance criteria.

## Project documents

- [Product Vision](docs/PRODUCT_VISION.md)
- [Engineering Principles](docs/ENGINEERING_PRINCIPLES.md)
- [Design Foundations](docs/DESIGN_FOUNDATIONS.md)
- [Roadmap & Stage Gates](docs/ROADMAP.md)
- [Repository Foundation Decisions](docs/decisions/REPOSITORY_FOUNDATION.md)
- [Contributing](CONTRIBUTING.md)
- [Security Policy](SECURITY.md)

## Current status

**Early implementation: design tokens, reusable components, an interactive example app, and automated quality checks are in place.**

The public API includes spacing, radii, neutral color primitives, typography roles, light/dark themes, themed input and button defaults, AppPage, SectionHeader, AppCard, AppButton, AppTextField, and EmptyState. The example app demonstrates theme selection, themed text input, component variants, and interactions. This is a growing foundation—not a complete design system or production-ready component library. CI validates Flutter 3.47.8; support for other SDK versions will be added after compatibility is verified.

## Run the example

The example source and widget tests are checked in. Native Android/iOS runner folders are intentionally not checked in yet; generate them once before running on a device.

From the repository root:

```sh
cd example
flutter create --platforms=android,ios .
flutter pub get
flutter run
```

The GitHub Actions workflow validates formatting, analysis, and widget tests for both the package and example. It does not yet claim an Android APK or iOS app build has been verified.

## Local quality checks

From the repository root:

```sh
flutter pub get
dart format --output=none --set-exit-if-changed .
flutter analyze --fatal-infos
flutter test
cd example
flutter pub get
flutter analyze --fatal-infos
flutter test
```

## Scope

The initial target is Flutter/Dart for Android and iOS. Riverpod, go_router, code generation, and Freezed are not required dependencies of the core UI package.

## License

Dartelier is licensed under the MIT License. See [LICENSE](LICENSE).
