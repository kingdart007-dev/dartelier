import 'package:flutter/material.dart';

import '../foundation/dartelier_radii.dart';

/// Visual treatment for AppButton.
enum AppButtonVariant {
  /// High-emphasis action.
  primary,

  /// Secondary action with a visible outline.
  secondary,

  /// Low-emphasis text action.
  tertiary,
}

/// A consistent action button with explicit loading and disabled states.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.loadingLabel,
    this.expand = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool isLoading;

  /// Optional localized announcement for the loading indicator.
  final String? loadingLabel;

  /// Whether the button should take the available horizontal width.
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(DartelierRadii.md),
    );
    final enabledCallback = isLoading ? null : onPressed;
    final content = <Widget>[
      if (isLoading) ...[
        Semantics(
          label: loadingLabel,
          liveRegion: true,
          container: true,
          child: const SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        const SizedBox(width: 10),
      ] else if (icon != null) ...[
        Icon(icon, size: 18),
        const SizedBox(width: 8),
      ],
      Flexible(child: Text(label, textAlign: TextAlign.center)),
    ];

    final Widget button = switch (variant) {
      AppButtonVariant.primary => FilledButton(
        onPressed: enabledCallback,
        style: FilledButton.styleFrom(shape: shape),
        child: Row(mainAxisSize: MainAxisSize.min, children: content),
      ),
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: enabledCallback,
        style: OutlinedButton.styleFrom(shape: shape),
        child: Row(mainAxisSize: MainAxisSize.min, children: content),
      ),
      AppButtonVariant.tertiary => TextButton(
        onPressed: enabledCallback,
        style: TextButton.styleFrom(shape: shape),
        child: Row(mainAxisSize: MainAxisSize.min, children: content),
      ),
    };

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
