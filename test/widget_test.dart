import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_calc/main.dart';
import 'package:simple_calc/button.dart';

void main() {
  testWidgets('1 + 2 = 3', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.widgetWithText(Button, '1'));
    await tester.tap(find.widgetWithText(SecondaryButton, '+'));
    await tester.tap(find.widgetWithText(Button, '2'));
    await tester.tap(find.widgetWithText(LongButton, '='));
    await tester.pump();
    String result =
        (find.byKey(Key('result-key')).evaluate().single.widget as Text).data;
    expect(result, '3');
  });
  testWidgets('2 - 1 = 1', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.widgetWithText(Button, '2'));
    await tester.tap(find.widgetWithText(SecondaryButton, '-'));
    await tester.tap(find.widgetWithText(Button, '1'));
    await tester.tap(find.widgetWithText(LongButton, '='));
    await tester.pump();
    String result =
        (find.byKey(Key('result-key')).evaluate().single.widget as Text).data;
    expect(result, '1');
  });

  testWidgets('6 / 2 = 3', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.widgetWithText(Button, '6'));
    await tester.tap(find.widgetWithText(SecondaryButton, '÷'));
    await tester.tap(find.widgetWithText(Button, '2'));
    await tester.tap(find.widgetWithText(LongButton, '='));
    await tester.pump();
    String result =
        (find.byKey(Key('result-key')).evaluate().single.widget as Text).data;
    expect(result, '3');
  });

  testWidgets('2 * 3 = 6', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.widgetWithText(Button, '2'));
    await tester.tap(find.widgetWithText(SecondaryButton, '×'));
    await tester.tap(find.widgetWithText(Button, '3'));
    await tester.tap(find.widgetWithText(LongButton, '='));
    await tester.pump();
    String result =
        (find.byKey(Key('result-key')).evaluate().single.widget as Text).data;
    expect(result, '6');
  });

  testWidgets('11 + 2 = 13', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.widgetWithText(Button, '1'));
    await tester.tap(find.widgetWithText(Button, '1'));
    await tester.tap(find.widgetWithText(SecondaryButton, '+'));
    await tester.tap(find.widgetWithText(Button, '2'));
    await tester.tap(find.widgetWithText(LongButton, '='));
    await tester.pump();
    String result =
        (find.byKey(Key('result-key')).evaluate().single.widget as Text).data;
    expect(result, '13');
  });

  testWidgets('3 + 21 = 24', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.widgetWithText(Button, '3'));
    await tester.tap(find.widgetWithText(SecondaryButton, '+'));
    await tester.tap(find.widgetWithText(Button, '2'));
    await tester.tap(find.widgetWithText(Button, '1'));
    await tester.tap(find.widgetWithText(LongButton, '='));
    await tester.pump();
    String result =
        (find.byKey(Key('result-key')).evaluate().single.widget as Text).data;
    expect(result, '24');
  });

  testWidgets('3 / 2 = 1.5', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.widgetWithText(Button, '3'));
    await tester.tap(find.widgetWithText(SecondaryButton, '÷'));
    await tester.tap(find.widgetWithText(Button, '2'));
    await tester.tap(find.widgetWithText(LongButton, '='));
    await tester.pump();
    String result =
        (find.byKey(Key('result-key')).evaluate().single.widget as Text).data;
    expect(result, '1.5');
  });

  testWidgets('-2 + 3 = 1', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.widgetWithText(Button, '2'));
    await tester.tap(find.widgetWithText(Button, '±'));
    await tester.tap(find.widgetWithText(SecondaryButton, '+'));
    await tester.tap(find.widgetWithText(Button, '3'));
    await tester.tap(find.widgetWithText(LongButton, '='));
    await tester.pump();
    String result =
        (find.byKey(Key('result-key')).evaluate().single.widget as Text).data;
    expect(result, '1');
  });
}
