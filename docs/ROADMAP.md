# Roadmap & Stage Gates

This roadmap is incremental. A stage advances only when its acceptance criteria are reviewed; files existing in the repository are not proof that checks passed.

## Stage 0 — Product definition and engineering principles
**Initial documents established; review remains ongoing.**

Deliverables: product vision, engineering principles, initial scope, non-goals, and risks.

## Stage 1 — Repository foundation
**Implementation in place; CI verification remains open.**

Implemented: single-package direction, package manifest, public entrypoint, analysis configuration, package tests, MIT license, quality workflow, contribution guidance, issue templates, and a runnable example package.

Acceptance gate:
- [x] One-package library direction documented.
- [x] Package manifest and public entrypoint exist.
- [x] Formatting, analysis, and tests are configured.
- [x] CI is configured for pushes and pull requests.
- [x] Contribution and issue-reporting paths are documented.
- [x] CI passes on the declared supported Flutter version.
- [ ] Clean-checkout setup is verified.

## Stage 2 — Design foundations
**Initial design tokens, themes, and layout primitives implemented; review continues.**

Implemented: spacing and radii, neutral palette, typography roles, light/dark theme starting points, safe-area-aware AppPage, and flexible SectionHeader.

Acceptance gate:
- [x] Spacing, radius, color, and typography primitives are centralized.
- [x] Light and dark themes use semantic color roles.
- [x] Foundation behavior has automated tests.
- [x] An automated Arabic RTL and enlarged-text smoke test exists.
- [ ] Contrast, text scaling, RTL, and reduced-motion review is complete.
- [ ] Theme behavior is reviewed on real Android and iOS devices.

## Stage 3 — First production-minded components
**First reusable slice implemented; quality verification remains open.**

Implemented: AppCard, AppButton, AppTextField, EmptyState, SectionHeader, and AppPage. The example app demonstrates component use, themed input, and theme switching.

Acceptance gate:
- [x] Components have narrow, documented APIs.
- [x] Button disabled/loading behavior and interactive card behavior have tests.
- [x] User-facing empty-state text is supplied by the consumer.
- [x] CI passes for package and example.
- [ ] Accessibility and localization behavior receives manual review.

## Stage 4 — Optional app foundation
Explore navigation, state, error handling, and project structure as optional patterns. Do not force Riverpod, go_router, or other dependencies on all users without evidence.

## Stage 5 — Developer tooling
Build only tools that solve demonstrated repetitive work or catch meaningful mistakes. Diagnostics must be actionable; tools must not silently discard user changes.

## Stage 6 — Guided or visual building (research gate)
This is exploratory, not promised. Validate user need and prove code ownership, inspectable diffs, undo, and safe manual-code edits before committing to a visual builder.

## Stage 7 — Release readiness
Review public APIs, dependencies, compatibility, accessibility, documentation, versioning, migration policy, and reproducible quality checks before release.

## Scope-change rule
Every addition should state the user problem, expected benefit, maintenance cost, and what it displaces. Revisit decisions as evidence changes.
