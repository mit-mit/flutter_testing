// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    Finder f;

    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    // Navigate to tap2.
    f = find.text('tab2');
    expect(f, findsOneWidget);
    await tester.tap(f);
    await tester.pump();

    // Verify that our counter starts at 0.
    f = find.byElementType(RaisedButton);
    expect(f, findsOneWidget);
    expect(find.text('Clicked 0 times'), findsOneWidget);
    expect(find.text('Clicked 42 times'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    tester.tap(f);
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));

    // Verify that our counter has incremented.
    expect(find.text('Clicked 1 times'), findsOneWidget);
    expect(find.text('Clicked 42 times'), findsNothing);
  });
}
