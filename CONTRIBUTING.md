# Contributing to Dartelier

Thanks for helping improve Dartelier. The goal is a dependable, customizable Flutter foundation—not the largest possible component catalogue.

## Before changing code

1. Read the README, Design Foundations, and Engineering Principles.
2. Keep the change focused on a user-visible problem or a clear maintenance need.
3. Prefer Flutter/Dart standard capabilities over new dependencies.
4. Keep the core package free of mandatory routing, state-management, code-generation, and backend dependencies.
5. Do not claim platform, accessibility, or SDK support without validation.

## Local checks

Use the Flutter version declared by the repository's CI, then run from the repository root:

```sh
flutter pub get
dart format .
flutter analyze --fatal-infos
flutter test
cd example
flutter pub get
flutter analyze --fatal-infos
flutter test
```

## Component expectations

- Keep public APIs narrow, documented, and customizable.
- Use semantic theme roles instead of hard-coded component colors.
- Do not bake English copy into shared components; accept caller-provided localized strings.
- Avoid fixed heights that clip text under text scaling or localization.
- Include disabled, loading, empty, or error states when the component's behavior requires them.
- Test observable behavior, including meaningful interaction and theme states.
- Preserve RTL-friendly layout and appropriate accessibility semantics.
- Avoid animations unless they improve feedback or comprehension; respect reduced-motion preferences when introducing motion.

## Pull requests

Describe the problem, the approach, important trade-offs, and how you verified the change. Include screenshots or a short recording for visual changes when practical. Note any checks that could not be run. Keep unrelated refactors out of the change.

## Commit hygiene

Use concise imperative commit messages. Do not include generated files unless the repository explicitly requires them. Never commit secrets, local environment files, or personal data.
