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

    final verticalScrollable = find.byWidgetPredicate(
      (widget) =>
          widget is Scrollable && widget.axisDirection == AxisDirection.down,
    ).first;

    await tester.scrollUntilVisible(
      find.text('Actions'),
      240,
      scrollable: verticalScrollable,
    );
    expect(find.text('Actions'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Empty state'),
      240,
      scrollable: verticalScrollable,
    );
    expect(find.text('Empty state'), findsOneWidget);
  });
}
