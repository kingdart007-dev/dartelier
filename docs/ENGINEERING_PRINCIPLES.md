# Engineering Principles & Decision Framework

**Status:** Initial working draft  
**Purpose:** Guide decisions consistently without turning principles into rigid dogma.

## 1. How to use this document

These are decision aids, not a checklist to apply mechanically. When principles conflict, optimize for the product's actual constraints and explain the trade-off. Safety, correctness, data protection, accessibility, platform correctness, and maintainability take priority over novelty.

For consequential decisions, record the context, options considered, decision, and consequences in an Architecture Decision Record (ADR). Do not create an ADR for every trivial implementation choice.

## 2. Core design principles

### SOLID
Use single responsibility, open/closed design, substitutability, interface segregation, and dependency inversion where they improve cohesion and changeability. Do not create interfaces, factories, or layers without a concrete benefit.

### DRY — Don't Repeat Yourself
Keep one authoritative source for a rule or piece of knowledge when it truly is the same concept. Similar-looking code is not automatically the same concept; premature deduplication can couple things that should evolve independently.

### KISS — Keep It Simple
Prefer the simplest design that meets verified requirements. Simplicity means low cognitive load and clear behavior, not necessarily the fewest lines.

### YAGNI — You Aren't Gonna Need It
Do not build speculative capabilities before there is evidence they are needed. Leave reasonable extension points where the cost is low, but do not build an entire future framework around guesses.

### Separation of concerns and cohesion
Keep responsibilities clear and related behavior together. Split code when doing so makes change, testing, or understanding easier—not merely to satisfy a preferred folder count.

### Principle of least astonishment
Names, defaults, error behavior, and APIs should behave as a reasonable Flutter/Dart developer expects. Document intentional deviations.

### Composition over inheritance
Prefer composition when it makes behavior more explicit and flexible. Use inheritance where it is genuinely the clearest fit; neither approach is an absolute rule.

### Law of Demeter
Limit unnecessary knowledge of other objects' internal structure. Avoid long chains of internal navigation when a stable, meaningful API would better express the operation.

### Gall's Law
Start with a small system that works, learn from it, and evolve it. Do not begin with a highly complex system that has not yet been validated.

### Hyrum's Law
Assume that once a public API is widely used, users may depend on observable behavior—even behavior that was not intended as a contract. Keep public surfaces deliberate, test behavior, and treat breaking changes seriously.

### Murphy's Law and failure-oriented design
Assume inputs can be invalid, operations can fail, and dependencies can be unavailable. Model loading, empty, error, retry, cancellation, and recovery states where relevant. Do not add elaborate recovery machinery to components that have no such failure mode.

### Boy Scout Rule
Leave nearby code clearer when making a change, provided the cleanup is safe and within scope. Avoid unrelated rewrites that obscure the purpose of a change.

### Measurement before optimization
Profile and measure meaningful performance concerns before adding complex optimization. Prevent obvious waste, but avoid speculative caching, custom rendering, or abstractions justified only by assumptions.

## 3. Flutter and Dart-specific rules

- Prefer idiomatic, readable Dart and standard Flutter capabilities when they meet the requirement.
- Keep widgets focused; extract a widget when it clarifies responsibility, reuse, or testing—not as a ritual.
- Keep build methods free of avoidable side effects and expensive work.
- Make state ownership and lifetimes explicit.
- Separate UI, domain rules, and external data access when complexity justifies the boundary.
- Use immutable values where they improve predictability; avoid ceremony that adds no meaningful safety.
- Handle asynchronous loading, errors, cancellation, and disposal correctly where applicable.
- Respect platform back behavior, keyboard insets, safe areas, text scaling, semantics, and reduced motion.
- Avoid hard-coded user-facing strings in reusable components; define a clear localization strategy before shipping user-facing copy.
- Avoid print() for application logging; never expose secrets or sensitive data in logs.
- Avoid code generation and Freezed by default. Reconsider only when measurable maintenance or correctness benefits justify the added toolchain.
- Do not force Riverpod, go_router, or another optional package on every consumer without a clear product reason.

## 4. API and customization rules

- Public APIs should be intentionally small, coherent, and documented.
- Choose defaults that are safe, useful, and visually consistent.
- Expose customization where consumers have a legitimate use case; do not expose every internal implementation detail.
- Prefer theme/tokens for global visual decisions and local parameters for genuinely local differences.
- Make invalid states difficult to express when possible without making the API awkward.
- Keep internal implementation private unless public exposure is justified.
- Evaluate the cost of breaking changes before publishing stable APIs.
- Provide migration notes when changes require consumer action.

## 5. Testing and quality rules

- Test behavior and risks, not only implementation details.
- Add unit tests for deterministic logic and widget tests for observable UI behavior.
- Cover meaningful states, accessibility semantics, theme changes, text scaling, and RTL where applicable.
- Use integration and real-device checks for behavior that unit/widget tests cannot reliably establish.
- Keep tests deterministic and avoid unnecessary timing dependence.
- Treat analyzer warnings and test failures as findings to resolve or explicitly justify—not as noise to suppress.
- Use coverage as a diagnostic signal, never as the only definition of test quality.
- Use repeatable CI quality gates and document checks that cannot yet be automated.

## 6. Dependency policy

Before adding a dependency, ask:
1. What concrete problem does it solve?
2. Can Flutter/Dart already solve this adequately?
3. Is the package maintained and compatible with our supported SDK range?
4. What are its transitive dependencies, license, platform implications, and security considerations?
5. Can consumers avoid it if they do not need the feature?
6. What is the exit or replacement cost?

Do not add dependencies solely for fashion or convenience when they introduce disproportionate long-term cost.

## 7. Design, accessibility, and platform rules

- Use centralized design tokens and a coherent theme system; avoid parallel sources of truth.
- Maintain intentional contrast and do not communicate state through color alone.
- Support scalable text and layouts that tolerate long strings and localization.
- Provide appropriate semantics, focus behavior, and usable touch targets.
- Respect reduced-motion preferences and avoid motion that harms clarity.
- Support English and Arabic with real LTR/RTL behavior where user-facing content is in scope.
- Verify Android and iOS behavior rather than assuming a widget looks or behaves identically on both.
- Avoid decorative effects that reduce readability, performance, or native usability.

## 8. Documentation and change management

- Explain why an important decision exists, not just what the code does.
- Keep examples aligned with the actual API and test them where practical.
- Distinguish planned, implemented, tested, and released capabilities.
- Prefer small, reviewable changes with clear commit messages.
- Never claim that a command, test, benchmark, or device check passed unless it was actually run and inspected.
- When a decision changes, update the relevant documentation rather than leaving contradictory guidance.

## 9. Decision template

For non-trivial choices, answer briefly:

- **Context:** What problem are we solving?
- **Constraints:** What must remain true?
- **Options:** What realistic alternatives exist?
- **Decision:** What are we choosing?
- **Trade-offs:** What does this make easier or harder?
- **Validation:** How will we know the decision works?
- **Revisit trigger:** What evidence would make us reconsider?

## 10. The final rule

A principle is useful only when it improves outcomes. If following a principle mechanically makes the system less understandable, less reliable, less accessible, or harder to maintain, explain the conflict and choose the better contextual solution.
