import 'package:flutter/material.dart';

/// Visual treatment for [AppIconButton].
enum AppIconButtonVariant {
  /// Low-emphasis icon action without a container.
  standard,

  /// High-emphasis icon action with a filled background.
  filled,

  /// Medium-emphasis icon action with a tonal background.
  tonal,

  /// Icon action with a visible outline.
  outlined,
}

/// A compact icon action with an explicit, accessible tooltip label.
///
/// Keep [tooltip] localized and action-oriented (for example, "Close dialog"
/// rather than "X"). Minimum size, focus, and interaction feedback are inherited
/// from the active Flutter theme and Dartelier's default theme.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.variant = AppIconButtonVariant.standard,
    this.iconSize,
    super.key,
  }) : assert(tooltip != '');

  /// Icon that communicates the action visually.
  final IconData icon;

  /// Accessible, localized name of the action.
  final String tooltip;

  /// Callback, or null to disable the action.
  final VoidCallback? onPressed;

  /// Visual emphasis for this action.
  final AppIconButtonVariant variant;

  /// Optional icon size override.
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, size: iconSize);

    return switch (variant) {
      AppIconButtonVariant.standard => IconButton(
        tooltip: tooltip,
        onPressed: onPressed,
        icon: iconWidget,
      ),
      AppIconButtonVariant.filled => IconButton.filled(
        tooltip: tooltip,
        onPressed: onPressed,
        icon: iconWidget,
      ),
      AppIconButtonVariant.tonal => IconButton.filledTonal(
        tooltip: tooltip,
        onPressed: onPressed,
        icon: iconWidget,
      ),
      AppIconButtonVariant.outlined => IconButton.outlined(
        tooltip: tooltip,
        onPressed: onPressed,
        icon: iconWidget,
      ),
    };
  }
}
