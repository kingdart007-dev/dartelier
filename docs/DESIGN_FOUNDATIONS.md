# Design Foundations

This document describes the first implemented design primitives. It is a starting contract, not a claim that the entire design system is complete.

## Visual direction

Dartelier starts with a restrained monochrome palette, generous whitespace, subtle outlines, rounded corners, and typography-led hierarchy. Avoid gradients, decorative glow, heavy elevation, and accent colors without a clear product need.

## Tokens

### Spacing

| Token | Logical pixels |
| --- | ---: |
| xxs | 4 |
| xs | 8 |
| sm | 12 |
| md | 16 |
| lg | 24 |
| xl | 32 |
| xxl | 48 |

### Corner radii

| Token | Logical pixels |
| --- | ---: |
| sm | 8 |
| md | 12 |
| lg | 16 |
| xl | 24 |
| pill | 999 |

### Typography

| Role | Size | Intended use |
| --- | ---: | --- |
| bodySmall | 12 | Supporting metadata |
| bodyMedium | 14 | Default body copy |
| bodyLarge | 16 | Comfortable reading / prominent body |
| titleMedium | 16 | Component titles |
| titleLarge | 20 | Section titles |
| headlineSmall | 24 | Page titles |

The host app owns font-family selection. This avoids bundling an unreviewed font and allows licensed Latin and Arabic families to be configured by consumers.

### Color

DartelierColors exposes neutral palette primitives. Components should prefer semantic roles from Theme.of(context).colorScheme so custom themes can change the appearance consistently. The default light and dark themes map those semantic roles to the monochrome palette.

## Theme usage

Wrap the application in Flutter's MaterialApp and pass DartelierTheme.light and DartelierTheme.dark as theme and darkTheme. Use ThemeMode.system when the operating system should select the theme. Apps can use copyWith or construct their own ThemeData from the semantic tokens.

The theme configures restrained outlined cards, filled form fields, consistent field focus/error states, and 48 logical-pixel minimum button targets. These are defaults; consuming apps can override component themes where product needs differ.

## Components

- AppPage: safe-area-aware, top-aligned, width-constrained page content. It does not own scrolling or navigation.
- SectionHeader: section title, optional supporting text, and optional trailing action.
- AppCard: low-elevation outlined grouping surface; optionally interactive.
- AppButton: primary, secondary, and tertiary action styles with disabled and loading states.
- EmptyState: reusable no-content/no-results layout; all user-facing text is supplied by the consumer for localization.

## Accessibility and localization

- Do not bake English copy into shared components. Provide translated labels from the consuming application.
- Respect text scaling; do not constrain content to fixed heights.
- Aim for comfortable touch targets and visible keyboard focus; validate on Android and iOS.
- Use semantic button labels for icon-only actions at the call site.
- Check color contrast and focus order in real screens, not just isolated widgets.
- Use Directionality and direction-aware padding/alignment for layouts that are meant to mirror. These first components avoid fixed directional padding where possible.
- An automated smoke test covers Arabic RTL layout at enlarged text scale; it complements, but does not replace, manual device review.
- Reduced-motion handling should be considered for future animated components; no custom animation is required by this foundation.

## Current limitations

- This is not a complete token set or a formal accessibility conformance claim.
- The default themes do not bundle a font or a localization delegate.
- Real-device review on Android and iOS is still required.
