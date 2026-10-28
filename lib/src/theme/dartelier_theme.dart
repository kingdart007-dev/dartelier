import 'package:flutter/material.dart';

/// Builds Dartelier's neutral, low-noise themes for Flutter applications.
///
/// These are starting points, not a branding lock-in. Applications can copy
/// the returned [ThemeData] and customize its color scheme and component themes.
abstract final class DartelierTheme {
  static const Color _ink = Color(0xFF191918);
  static const Color _mutedInk = Color(0xFF666662);
  static const Color _paper = Color(0xFFFFFFFF);
  static const Color _softPaper = Color(0xFFF7F7F5);
  static const Color _darkCanvas = Color(0xFF111110);
  static const Color _darkSurface = Color(0xFF1B1B19);
  static const Color _darkText = Color(0xFFF3F3EF);
  static const Color _darkMutedText = Color(0xFFB5B5AE);
  static const Color _outline = Color(0xFFE4E4E0);
  static const Color _darkOutline = Color(0xFF393936);
  static const Color _error = Color(0xFFB3261E);
  static const Color _darkError = Color(0xFFFFB4AB);

  /// Neutral light theme with explicit semantic colors and restrained surfaces.
  static ThemeData get light {
    const scheme = ColorScheme.light(
      primary: _ink,
      onPrimary: _paper,
      secondary: _mutedInk,
      onSecondary: _paper,
      surface: _paper,
      onSurface: _ink,
      error: _error,
      onError: _paper,
      outline: _outline,
      outlineVariant: Color(0xFFEEEEEA),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: _paper,
      dividerColor: _outline,
      canvasColor: _paper,
      cardColor: _softPaper,
    );
  }

  /// Neutral dark theme designed around charcoal rather than pure black.
  static ThemeData get dark {
    const scheme = ColorScheme.dark(
      primary: _darkText,
      onPrimary: _darkCanvas,
      secondary: _darkMutedText,
      onSecondary: _darkCanvas,
      surface: _darkSurface,
      onSurface: _darkText,
      error: _darkError,
      onError: _darkCanvas,
      outline: _darkOutline,
      outlineVariant: Color(0xFF292926),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: _darkCanvas,
      dividerColor: _darkOutline,
      canvasColor: _darkCanvas,
      cardColor: _darkSurface,
    );
  }
}
