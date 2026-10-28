import 'package:flutter/material.dart';

/// Default type scale for Dartelier's neutral UI foundation.
///
/// Font families are intentionally inherited from the host app so applications
/// can supply licensed fonts and script-appropriate fallbacks.
abstract final class DartelierTypography {
  static const double bodySize = 14;
  static const double titleSize = 16;
  static const double sectionSize = 20;
  static const double pageTitleSize = 24;

  /// A compact type scale with explicit roles and no bundled font dependency.
  static const TextTheme textTheme = TextTheme(
    bodySmall: TextStyle(fontSize: 12, height: 1.4),
    bodyMedium: TextStyle(fontSize: bodySize, height: 1.45),
    bodyLarge: TextStyle(fontSize: 16, height: 1.5),
    titleMedium: TextStyle(fontSize: titleSize, height: 1.35, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontSize: sectionSize, height: 1.3, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontSize: pageTitleSize, height: 1.25, fontWeight: FontWeight.w600),
  );
}
