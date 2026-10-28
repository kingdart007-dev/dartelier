import 'package:flutter/material.dart';

import '../foundation/dartelier_spacing.dart';

/// A consistent page container with safe-area handling and a readable width.
///
/// [AppPage] intentionally does not impose scrolling or navigation. Compose it
/// with a scrollable when the screen's content needs to scroll.
class AppPage extends StatelessWidget {
  const AppPage({
    required this.child,
    this.padding = const EdgeInsets.all(DartelierSpacing.lg),
    this.maxWidth = 640,
    this.useSafeArea = true,
    super.key,
  }) : assert(maxWidth > 0, 'maxWidth must be greater than zero');

  /// The page content.
  final Widget child;

  /// Space between the content and the page's available bounds.
  final EdgeInsetsGeometry padding;

  /// Maximum content width, useful on larger phones and split-screen layouts.
  final double maxWidth;

  /// Whether system safe areas should be respected.
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    Widget content = Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: SizedBox(
          width: double.infinity,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );

    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return content;
  }
}
