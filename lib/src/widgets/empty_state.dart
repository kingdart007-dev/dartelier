import 'package:flutter/material.dart';

import '../foundation/dartelier_spacing.dart';

/// A reusable empty, first-run, or no-results state.
///
/// All user-facing copy is provided by the caller so the component can be
/// localized without baking English strings into the shared library.
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.title,
    this.description,
    this.icon,
    this.action,
    this.maxWidth = 360,
    super.key,
  }) : assert(maxWidth > 0, 'maxWidth must be greater than zero');

  final String title;
  final String? description;
  final IconData? icon;
  final Widget? action;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.all(DartelierSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 36,
                  color: theme.colorScheme.onSurfaceVariant,
                  semanticLabel: null,
                ),
                const SizedBox(height: DartelierSpacing.md),
              ],
              Text(
                title,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              if (description case final description?) ...[
                const SizedBox(height: DartelierSpacing.xs),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              if (action != null) ...[
                const SizedBox(height: DartelierSpacing.lg),
                action!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
