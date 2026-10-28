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

  group('AppPage', () {
    testWidgets('centers content within its maximum width', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppPage(
              maxWidth: 320,
              useSafeArea: false,
              child: SizedBox(key: Key('page-content'), height: 40),
            ),
          ),
        ),
      );

      final content = tester.getRect(find.byKey(const Key('page-content')));
      expect(content.width, 272);
      expect(content.center.dx, 400);
    });

    testWidgets('respects custom padding', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppPage(
              padding: EdgeInsets.all(10),
              useSafeArea: false,
              child: SizedBox(key: Key('page-content'), width: 100, height: 40),
            ),
          ),
        ),
      );

      expect(tester.getTopLeft(find.byKey(const Key('page-content'))).dx, 10);
      expect(tester.getTopLeft(find.byKey(const Key('page-content'))).dy, 10);
    });
  });

  group('SectionHeader', () {
    testWidgets('shows title and optional subtitle', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionHeader(
              title: 'Your activity',
              subtitle: 'A summary of today',
            ),
          ),
        ),
      );

      expect(find.text('Your activity'), findsOneWidget);
      expect(find.text('A summary of today'), findsOneWidget);
    });

    testWidgets('supports a trailing action', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionHeader(
              title: 'Recent items',
              trailing: TextButton(onPressed: null, child: Text('See all')),
            ),
          ),
        ),
      );

      expect(find.text('Recent items'), findsOneWidget);
      expect(find.text('See all'), findsOneWidget);
    });
  });
}
