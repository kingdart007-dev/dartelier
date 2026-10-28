# Dartelier

**A thoughtfully engineered Flutter UI system and toolkit for building maintainable mobile apps.**

Dartelier aims to make Flutter development more consistent and approachable—from reusable design foundations for experienced engineers to better-guided workflows for newer developers. Implementation is incremental: we validate the foundations before expanding into a large component catalogue or visual app builder.

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
- [Roadmap & Stage Gates](docs/ROADMAP.md)
- [Repository Foundation Decisions](docs/decisions/REPOSITORY_FOUNDATION.md)

## Current status

**Early implementation: initial design foundations are in progress.**

The package currently exposes a small spacing scale, corner-radius scale, and neutral light/dark `ThemeData` starting points. These are the first foundations—not a complete design system or a production-ready component library. CI is being used to validate the minimum supported Flutter version and the current stable channel; check the [Actions results](https://github.com/kingdart007-dev/dartelier/actions) for the latest status.

## Scope and package structure

The initial target is Flutter/Dart for Android and iOS. The repository starts as one package named `dartelier`; separate packages and an example app will be added only when a real use case justifies them.

## Local quality checks

With a compatible Flutter SDK installed, run:

```sh
flutter pub get
dart format --output=none --set-exit-if-changed .
flutter analyze --fatal-infos
flutter test
```

## License

Dartelier is licensed under the MIT License. See [LICENSE](LICENSE).
