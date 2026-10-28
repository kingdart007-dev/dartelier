import 'package:flutter/material.dart';

import '../foundation/dartelier_colors.dart';
import '../foundation/dartelier_radii.dart';
import '../foundation/dartelier_spacing.dart';
import '../foundation/dartelier_typography.dart';

/// Builds Dartelier's neutral, low-noise themes for Flutter applications.
///
/// These are starting points, not a branding lock-in. Applications can copy
/// the returned ThemeData and customize its color scheme and component themes.
abstract final class DartelierTheme {
  static const BorderRadius _controlRadius = BorderRadius.all(
    Radius.circular(DartelierRadii.md),
  );

  static RoundedRectangleBorder _buttonShape() =>
      const RoundedRectangleBorder(borderRadius: _controlRadius);

  static InputDecorationTheme _inputTheme({
    required Color fillColor,
    required Color outline,
    required Color focused,
    required Color error,
    required Color mutedText,
    required Color disabledOutline,
  }) {
    OutlineInputBorder border(Color color, {double width = 1}) =>
        OutlineInputBorder(
          borderRadius: _controlRadius,
          borderSide: BorderSide(color: color, width: width),
        );

    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: DartelierSpacing.md,
        vertical: DartelierSpacing.sm,
      ),
      hintStyle: TextStyle(color: mutedText),
      labelStyle: TextStyle(color: mutedText),
      border: border(outline),
      enabledBorder: border(outline),
      focusedBorder: border(focused, width: 1.5),
      errorBorder: border(error),
      focusedErrorBorder: border(error, width: 1.5),
      disabledBorder: border(disabledOutline),
    );
  }

  static ButtonStyle _filledButtonStyle() => FilledButton.styleFrom(
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: DartelierSpacing.md,
          vertical: DartelierSpacing.sm,
        ),
        shape: _buttonShape(),
      );

  static ButtonStyle _outlinedButtonStyle() => OutlinedButton.styleFrom(
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: DartelierSpacing.md,
          vertical: DartelierSpacing.sm,
        ),
        shape: _buttonShape(),
      );

  static ButtonStyle _textButtonStyle() => TextButton.styleFrom(
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: DartelierSpacing.md,
          vertical: DartelierSpacing.sm,
        ),
        shape: _buttonShape(),
      );

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
          borderRadius: BorderRadius.all(Radius.circular(DartelierRadii.lg)),
          side: BorderSide(color: DartelierColors.outline),
        ),
      ),
      inputDecorationTheme: _inputTheme(
        fillColor: DartelierColors.softPaper,
        outline: DartelierColors.outline,
        focused: scheme.primary,
        error: scheme.error,
        mutedText: scheme.onSurfaceVariant,
        disabledOutline: scheme.outlineVariant,
      ),
      filledButtonTheme: FilledButtonThemeData(style: _filledButtonStyle()),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _outlinedButtonStyle(),
      ),
      textButtonTheme: TextButtonThemeData(style: _textButtonStyle()),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: _buttonShape(),
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
          borderRadius: BorderRadius.all(Radius.circular(DartelierRadii.lg)),
          side: BorderSide(color: DartelierColors.outlineDark),
        ),
      ),
      inputDecorationTheme: _inputTheme(
        fillColor: DartelierColors.surfaceDark,
        outline: DartelierColors.outlineDark,
        focused: scheme.primary,
        error: scheme.error,
        mutedText: scheme.onSurfaceVariant,
        disabledOutline: scheme.outlineVariant,
      ),
      filledButtonTheme: FilledButtonThemeData(style: _filledButtonStyle()),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _outlinedButtonStyle(),
      ),
      textButtonTheme: TextButtonThemeData(style: _textButtonStyle()),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: _buttonShape(),
        ),
      ),
    );
  }
}
