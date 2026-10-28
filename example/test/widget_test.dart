import 'package:dartelier_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('example app renders its main component showcase',
      (tester) async {
    await tester.pumpWidget(const DartelierExampleApp());

    expect(find.text('DARTELIER'), findsOneWidget);
    expect(find.text('Surfaces'), findsOneWidget);
    expect(find.text('Actions'), findsOneWidget);
    expect(find.text('Empty state'), findsOneWidget);
    expect(find.text('Try an interaction'), findsOneWidget);
  });
}
