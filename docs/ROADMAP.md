# Roadmap & Stage Gates

This roadmap is intentionally incremental. A stage advances only when its acceptance criteria are reviewed; the presence of files alone is not proof of completion.

## Stage 0 — Product definition and engineering principles
**Current stage**

Deliverables:
- Product vision and success criteria.
- Engineering principles and decision framework.
- Explicit initial scope and non-goals.

Acceptance gate:
- [ ] Product boundaries and intended audiences are clear.
- [ ] Initial scope is small enough to validate.
- [ ] Engineering principles describe trade-offs, not dogma.
- [ ] Open questions and risks are recorded.

## Stage 1 — Repository foundation
Planned deliverables:
- Decide package/workspace layout and public package boundaries.
- Add repository conventions and contribution guidance.
- Establish formatting, static analysis, and test commands.
- Add minimal CI checks that can run reliably.
- Choose and document the license before public distribution.

Acceptance gate:
- [ ] A clean checkout can follow documented setup instructions.
- [ ] Static analysis and tests run with documented commands.
- [ ] CI checks the agreed baseline.
- [ ] No unnecessary dependencies or placeholder framework layers exist.

## Stage 2 — Design foundations
Planned deliverables:
- Color, typography, spacing, radius, and motion foundations.
- Light, dark, and system theme behavior.
- Clear customization APIs.
- Localization/RTL and accessibility conventions.

Acceptance gate:
- [ ] Tokens have a single source of truth.
- [ ] Theme changes propagate to dependent components.
- [ ] Contrast, text scaling, RTL, and reduced motion have a documented verification approach.
- [ ] Foundations are tested before a large component catalogue is added.

## Stage 3 — First production-minded components
Planned deliverables:
- A deliberately small selection of high-value components.
- Clear states, semantics, customization, examples, and tests.

Acceptance gate:
- [ ] Public APIs are documented.
- [ ] Important normal, disabled, loading, error, and edge states are handled where relevant.
- [ ] Theme, accessibility, and RTL behavior are tested where applicable.
- [ ] Examples match the real implementation.

## Stage 4 — App foundation (optional layer)
Planned deliverables:
- Optional patterns for navigation, state, errors, and project organization.
- Clear boundaries so consumers can adopt only what they need.

Acceptance gate:
- [ ] Every abstraction solves a demonstrated recurring problem.
- [ ] Optional dependencies are not forced on all consumers.
- [ ] A small example app demonstrates the intended use.

## Stage 5 — Developer tooling
Planned deliverables:
- Only tools shown to remove repetitive work or catch meaningful mistakes.
- Clear commands, diagnostics, and safe failure behavior.

Acceptance gate:
- [ ] Each tool has a specific user problem and measurable benefit.
- [ ] Errors are actionable.
- [ ] Tooling does not silently rewrite or discard user work.

## Stage 6 — Guided or visual building (research gate)
This stage is exploratory, not promised. Investigate user needs and technical feasibility before implementation.

Questions:
- Can visual editing preserve understandable, maintainable Dart code?
- How will manual code changes interact with visual edits?
- Can users inspect diffs, undo changes, and recover from mistakes?
- Which users and app types benefit enough to justify the complexity?

Acceptance gate:
- [ ] Evidence of user need exists.
- [ ] A small prototype demonstrates code ownership and editability.
- [ ] Complexity and maintenance cost are justified against simpler alternatives.

## Stage 7 — Release readiness
Planned deliverables:
- API, dependency, compatibility, documentation, and accessibility review.
- Versioning and migration policy.
- Reproducible quality checks.

Acceptance gate:
- [ ] All release checks have recorded results.
- [ ] Known limitations are documented.
- [ ] Version compatibility and license are explicit.
- [ ] No unsupported claims are made about testing or readiness.

## Scope-change rule

New ideas are welcome, but every addition must state the user problem, expected benefit, ongoing maintenance cost, and what it displaces. Revisit this roadmap as evidence changes.
