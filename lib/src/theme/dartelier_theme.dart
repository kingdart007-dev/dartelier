import 'package:flutter/material.dart';

import '../foundation/dartelier_colors.dart';
import '../foundation/dartelier_typography.dart';

/// Builds Dartelier's neutral, low-noise themes for Flutter applications.
///
/// These are starting points, not a branding lock-in. Applications can copy
/// the returned ThemeData and customize its color scheme and component themes.
abstract final class DartelierTheme {
  /// Neutral light theme with semantic colors and restrained surfaces.
  static ThemeData get light {
    const scheme = ColorScheme.light(
      primary: DartelierColors.ink,
      onPrimary: DartelierColors.paper,
      secondary: DartelierColors.mutedInk,
      onSecondary: DartelierColors.paper,
      surface: DartelierColors.paper,
      onSurface: DartelierColors.ink,
      onSurfaceVariant: DartelierColors.mutedInk,
      error: DartelierColors.error,
      onError: DartelierColors.paper,
      outline: DartelierColors.outline,
      outlineVariant: Color(0xFFEEEEEA),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: DartelierTypography.textTheme.apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),
      scaffoldBackgroundColor: DartelierColors.paper,
      dividerColor: DartelierColors.outline,
      canvasColor: DartelierColors.paper,
      cardColor: DartelierColors.softPaper,
      cardTheme: const CardThemeData(
        color: DartelierColors.softPaper,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: DartelierColors.outline),
        ),
      ),
    );
  }

  /// Neutral dark theme designed around charcoal rather than pure black.
  static ThemeData get dark {
    const scheme = ColorScheme.dark(
      primary: DartelierColors.textDark,
      onPrimary: DartelierColors.canvasDark,
      secondary: DartelierColors.mutedTextDark,
      onSecondary: DartelierColors.canvasDark,
      surface: DartelierColors.surfaceDark,
      onSurface: DartelierColors.textDark,
      onSurfaceVariant: DartelierColors.mutedTextDark,
      error: DartelierColors.errorDark,
      onError: DartelierColors.canvasDark,
      outline: DartelierColors.outlineDark,
      outlineVariant: Color(0xFF292926),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: DartelierTypography.textTheme.apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),
      scaffoldBackgroundColor: DartelierColors.canvasDark,
      dividerColor: DartelierColors.outlineDark,
      canvasColor: DartelierColors.canvasDark,
      cardColor: DartelierColors.surfaceDark,
      cardTheme: const CardThemeData(
        color: DartelierColors.surfaceDark,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: DartelierColors.outlineDark),
        ),
      ),
    );
  }
}
