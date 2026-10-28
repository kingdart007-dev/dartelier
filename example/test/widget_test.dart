import 'package:dartelier_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('example app renders its main component showcase', (
    tester,
  ) async {
    await tester.pumpWidget(const DartelierExampleApp());

    expect(find.text('DARTELIER'), findsOneWidget);
    expect(
      find.text('Good design starts with good foundations.'),
      findsOneWidget,
    );
    expect(find.text('Surfaces'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Actions'), 240);
    expect(find.text('Actions'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Empty state'), 240);
    expect(find.text('Empty state'), findsOneWidget);
  });
}
