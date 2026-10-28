import 'package:flutter/material.dart';

import '../foundation/dartelier_radii.dart';
import '../foundation/dartelier_spacing.dart';

/// A restrained surface for grouping related content.
///
/// When onTap is supplied, the surface becomes interactive and exposes the
/// normal Material ink response and semantics of an InkWell.
class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.padding = const EdgeInsets.all(DartelierSpacing.md),
    this.onTap,
    this.semanticLabel,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  /// Optional label for the whole surface when the card itself is interactive.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(DartelierRadii.lg);
    final content = Padding(padding: padding, child: child);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : Semantics(
              button: true,
              label: semanticLabel,
              child: InkWell(
                borderRadius: radius,
                onTap: onTap,
                child: content,
              ),
            ),
    );
  }
}
