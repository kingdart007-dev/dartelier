import 'package:dartelier/dartelier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design tokens', () {
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

    test('provides a neutral semantic palette and type scale', () {
      expect(DartelierColors.ink, const Color(0xFF191918));
      expect(DartelierTypography.bodySize, 14);
      expect(DartelierTypography.titleSize, 16);
      expect(DartelierTypography.sectionSize, 20);
      expect(DartelierTypography.pageTitleSize, 24);
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

    test('uses Material 3 and exposes semantic text styles', () {
      expect(DartelierTheme.light.useMaterial3, isTrue);
      expect(DartelierTheme.light.textTheme.bodyMedium?.fontSize, 14);
      expect(DartelierTheme.light.textTheme.titleMedium?.fontSize, 16);
      final customized = DartelierTheme.light.copyWith(
        visualDensity: VisualDensity.compact,
      );
      expect(customized.visualDensity, VisualDensity.compact);
    });

    test('configures consistent form fields and touch targets', () {
      final light = DartelierTheme.light;
      final dark = DartelierTheme.dark;

      expect(light.inputDecorationTheme.filled, isTrue);
      expect(dark.inputDecorationTheme.filled, isTrue);
      expect(
        light.filledButtonTheme.style?.minimumSize?.resolve(<WidgetState>{}),
        const Size(48, 48),
      );
      expect(
        light.iconButtonTheme.style?.minimumSize?.resolve(<WidgetState>{}),
        const Size(48, 48),
      );
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

      expect(tester.getTopLeft(find.byKey(const Key('page-content'))).dx, 90);
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

    testWidgets('supports RTL and enlarged text without layout errors', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(textScaler: TextScaler.linear(2)),
            child: const Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: AppPage(
                  padding: EdgeInsets.all(16),
                  child: SectionHeader(
                    title: 'ملخص النشاط اليومي',
                    subtitle: 'تفاصيل إضافية تظهر هنا باللغة العربية',
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('ملخص النشاط اليومي'), findsOneWidget);
      expect(
        find.text('تفاصيل إضافية تظهر هنا باللغة العربية'),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    });
  });

  group('AppButton', () {
    testWidgets('invokes the primary action', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(label: 'Continue', onPressed: () => tapped = true),
          ),
        ),
      );

      await tester.tap(find.text('Continue'));
      expect(tapped, isTrue);
    });

    testWidgets('disables its action and shows progress while loading', (
      tester,
    ) async {
      final semantics = tester.ensureSemantics();

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Saving',
              onPressed: null,
              isLoading: true,
              loadingLabel: 'Saving in progress',
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.bySemanticsLabel('Saving in progress'), findsOneWidget);
      expect(
        tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNull,
      );
      semantics.dispose();
    });

    testWidgets('supports variants and full-width layout', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Learn more',
              onPressed: null,
              variant: AppButtonVariant.secondary,
              expand: true,
            ),
          ),
        ),
      );

      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(tester.getSize(find.byType(OutlinedButton)).width, 800);
    });
  });

  group('AppCard', () {
    testWidgets('renders content and handles taps when interactive', (
      tester,
    ) async {
      var tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCard(
              onTap: () => tapped = true,
              semanticLabel: 'Open summary',
              child: const Text('Summary'),
            ),
          ),
        ),
      );

      expect(find.text('Summary'), findsOneWidget);
      await tester.tap(find.text('Summary'));
      expect(tapped, isTrue);
    });
  });

  group('AppTextField', () {
    testWidgets('renders its label and hint using the active theme', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DartelierTheme.light,
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16),
              child: AppTextField(label: 'Email', hintText: 'you@example.com'),
            ),
          ),
        ),
      );

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('you@example.com'), findsOneWidget);
    });

    testWidgets('shows caller-provided validation errors', (tester) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          theme: DartelierTheme.light,
          home: Scaffold(
            body: Form(
              key: formKey,
              child: AppTextField(
                label: 'Name',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
            ),
          ),
        ),
      );

      expect(formKey.currentState!.validate(), isFalse);
      await tester.pump();
      expect(find.text('Required'), findsOneWidget);
    });

    testWidgets('supports disabled and read-only states', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppTextField(label: 'Disabled', enabled: false),
                AppTextField(label: 'Read only', readOnly: true),
              ],
            ),
          ),
        ),
      );

      final formFields = tester.widgetList<TextFormField>(
        find.byType(TextFormField),
      );
      final textFields = tester.widgetList<TextField>(find.byType(TextField));
      expect(formFields.first.enabled, isFalse);
      expect(textFields.last.readOnly, isTrue);
    });
  });

  group('EmptyState', () {
    testWidgets('renders supplied localized copy and optional action', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: EmptyState(
              title: 'لا توجد نتائج',
              description: 'جرّب البحث مرة أخرى',
              icon: Icons.search,
              action: Text('إعادة المحاولة'),
            ),
          ),
        ),
      );

      expect(find.text('لا توجد نتائج'), findsOneWidget);
      expect(find.text('جرّب البحث مرة أخرى'), findsOneWidget);
      expect(find.text('إعادة المحاولة'), findsOneWidget);
    });
  });
}
