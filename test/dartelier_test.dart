import 'package:dartelier/dartelier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DartelierSpacing', () {
    test('exposes the documented spacing scale', () {
      expect(
        <double>[
          DartelierSpacing.xxs,
          DartelierSpacing.xs,
          DartelierSpacing.sm,
          DartelierSpacing.md,
          DartelierSpacing.lg,
          DartelierSpacing.xl,
          DartelierSpacing.xxl,
        ],
        <double>[4, 8, 12, 16, 24, 32, 48],
      );
    });
  });

  group('DartelierRadii', () {
    test('exposes the documented radius scale', () {
      expect(
        <double>[
          DartelierRadii.sm,
          DartelierRadii.md,
          DartelierRadii.lg,
          DartelierRadii.xl,
        ],
        <double>[8, 12, 16, 24],
      );
      expect(DartelierRadii.pill, greaterThan(DartelierRadii.xl));
    });
  });

  group('DartelierTheme', () {
    test('provides distinct light and dark themes', () {
      expect(DartelierTheme.light.brightness, Brightness.light);
      expect(DartelierTheme.dark.brightness, Brightness.dark);
      expect(
        DartelierTheme.light.scaffoldBackgroundColor,
        isNot(DartelierTheme.dark.scaffoldBackgroundColor),
      );
    });

    test('uses Material 3 while allowing normal ThemeData customization', () {
      final customized = DartelierTheme.light.copyWith(
        visualDensity: VisualDensity.compact,
      );

      expect(DartelierTheme.light.useMaterial3, isTrue);
      expect(customized.visualDensity, VisualDensity.compact);
    });
  });
}
