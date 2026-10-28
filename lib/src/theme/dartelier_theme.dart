import 'package:flutter/material.dart';

import '../foundation/dartelier_colors.dart';
import '../foundation/dartelier_radii.dart';
import '../foundation/dartelier_spacing.dart';
import '../foundation/dartelier_typography.dart';

/// Builds Dartelier's neutral, low-noise themes for Flutter applications.
///
/// The defaults are starting points, not a branding lock-in. Use
/// [fromColorScheme] to retain Dartelier's component defaults while adopting
/// an application's own semantic palette.
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

  static ButtonStyle _buttonStyle(ShapeBorder shape) =>
      FilledButton.styleFrom(
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: DartelierSpacing.md,
          vertical: DartelierSpacing.sm,
        ),
        shape: shape,
      );

  static ThemeData _build({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required Color cardColor,
    required Color inputFillColor,
  }) {
    final buttonShape = _buttonShape();

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: DartelierTypography.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      dividerColor: colorScheme.outline,
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(DartelierRadii.lg),
          ),
          side: BorderSide(color: colorScheme.outline),
        ),
      ),
      inputDecorationTheme: _inputTheme(
        fillColor: inputFillColor,
        outline: colorScheme.outline,
        focused: colorScheme.primary,
        error: colorScheme.error,
        mutedText: colorScheme.onSurfaceVariant,
        disabledOutline: colorScheme.outlineVariant,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: _buttonStyle(buttonShape),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: DartelierSpacing.md,
            vertical: DartelierSpacing.sm,
          ),
          shape: buttonShape,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: DartelierSpacing.md,
            vertical: DartelierSpacing.sm,
          ),
          shape: buttonShape,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: buttonShape,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DartelierRadii.sm / 2),
        ),
        side: BorderSide(color: colorScheme.outline),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colorScheme.primary
              : colorScheme.onSurfaceVariant,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colorScheme.onPrimary
              : colorScheme.onSurfaceVariant,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colorScheme.primary
              : colorScheme.surfaceContainerHighest,
        ),
        trackOutlineColor: WidgetStatePropertyAll(colorScheme.outlineVariant),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceContainerHighest,
        circularTrackColor: colorScheme.surfaceContainerHighest,
      ),
      dialogTheme: DialogThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DartelierRadii.xl),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DartelierRadii.md),
        ),
        insetPadding: const EdgeInsets.all(DartelierSpacing.md),
      ),
    );
  }

  /// Creates a Dartelier theme from a caller-owned semantic color scheme.
  ///
  /// The supplied scheme controls primary, text, surface, outline, and error
  /// colors. Component shapes, spacing, typography, and touch targets remain
  /// consistent. For best results, provide a scheme with accessible contrast
  /// and populated Material 3 surface-container roles.
  static ThemeData fromColorScheme(ColorScheme colorScheme) {
    return _build(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      cardColor: colorScheme.surfaceContainerLow,
      inputFillColor: colorScheme.surfaceContainerHighest,
    );
  }

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
      surfaceContainerLow: DartelierColors.softPaper,
      surfaceContainerHighest: Color(0xFFF2F2EF),
    );

    return _build(
      colorScheme: scheme,
      scaffoldBackgroundColor: DartelierColors.paper,
      cardColor: DartelierColors.softPaper,
      inputFillColor: DartelierColors.softPaper,
    );
  }

  /// Neutral dark theme designed around charcoal rather than pure black.
  static ThemeData get dark {
    const scheme = ColorScheme.dark(
      primary: DartelierColors.textDark,
      onPrimary: DartelierColors.canvasDark,
      secondary: DartelierColors.mutedTextDark,
      onSecondary: DartelierColors.canvasDark,
      surface: DartelierColors.canvasDark,
      onSurface: DartelierColors.textDark,
      onSurfaceVariant: DartelierColors.mutedTextDark,
      error: DartelierColors.errorDark,
      onError: DartelierColors.canvasDark,
      outline: DartelierColors.outlineDark,
      outlineVariant: Color(0xFF292926),
      surfaceContainerLow: DartelierColors.surfaceDark,
      surfaceContainerHighest: Color(0xFF242422),
    );

    return _build(
      colorScheme: scheme,
      scaffoldBackgroundColor: DartelierColors.canvasDark,
      cardColor: DartelierColors.surfaceDark,
      inputFillColor: DartelierColors.surfaceDark,
    );
  }
}
