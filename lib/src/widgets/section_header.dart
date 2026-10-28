import 'package:flutter/material.dart';

import '../foundation/dartelier_spacing.dart';

/// A compact section heading with optional supporting text and trailing action.
///
/// The layout allows the title and subtitle to wrap instead of forcing a fixed
/// height, keeping the component usable with large text and localized strings.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    this.subtitle,
    this.trailing,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleMedium;
    final subtitleStyle = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    final heading = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: titleStyle),
        if (subtitle case final subtitle?)
          Padding(
            padding: const EdgeInsets.only(top: DartelierSpacing.xxs),
            child: Text(subtitle, style: subtitleStyle),
          ),
      ],
    );

    if (trailing == null) {
      return heading;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: heading),
        const SizedBox(width: DartelierSpacing.sm),
        trailing!,
      ],
    );
  }
}
