import 'package:flutter/material.dart';

/// Neutral color primitives used by Dartelier's default themes.
///
/// Components should prefer semantic ColorScheme roles where possible.
/// Use these raw values when building custom themes or extending the system.
abstract final class DartelierColors {
  static const Color ink = Color(0xFF191918);
  static const Color mutedInk = Color(0xFF666662);
  static const Color paper = Color(0xFFFFFFFF);
  static const Color softPaper = Color(0xFFF7F7F5);
  static const Color canvasDark = Color(0xFF111110);
  static const Color surfaceDark = Color(0xFF1B1B19);
  static const Color textDark = Color(0xFFF3F3EF);
  static const Color mutedTextDark = Color(0xFFB5B5AE);
  static const Color outline = Color(0xFFE4E4E0);
  static const Color outlineDark = Color(0xFF393936);
  static const Color error = Color(0xFFB3261E);
  static const Color errorDark = Color(0xFFFFB4AB);
}
