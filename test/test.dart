import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_calc/main.dart';
import 'package:simple_calc/button.dart';

void main() {
  testWidgets('1 + 2 = 3', (WidgetTester t) async {
    await pump(t);

    await clickNumButton(t, 1);
    await clickOperation(t, '+');
    await clickNumButton(t, 2);
    await clickEquals(t);

    expect(getCalcResult(), '3');
  });
  testWidgets('2 - 1 = 1', (WidgetTester t) async {
    await pump(t);

    await clickNumButton(t, 2);
    await clickOperation(t, '-');
    await clickNumButton(t, 1);
    await clickEquals(t);

    expect(getCalcResult(), '1');
  });

  testWidgets('6 ÷ 2 = 3', (WidgetTester t) async {
    await pump(t);

    await clickNumButton(t, 6);
    await clickOperation(t, '÷');
    await clickNumButton(t, 2);
    await clickEquals(t);
    expect(getCalcResult(), '3');
  });

  testWidgets('2 * 3 = 6', (WidgetTester t) async {
    await pump(t);

    await clickNumButton(t, 2);
    await clickOperation(t, '×');
    await clickNumButton(t, 3);
    await clickEquals(t);

    expect(getCalcResult(), '6');
  });

  testWidgets('11 + 2 = 13', (WidgetTester t) async {
    await pump(t);

    await clickNumButton(t, 1);
    await clickNumButton(t, 1);
    await clickOperation(t, '+');
    await clickNumButton(t, 2);
    await clickEquals(t);

    expect(getCalcResult(), '13');
  });

  testWidgets('3 + 21 = 24', (WidgetTester t) async {
    await pump(t);

    await clickNumButton(t, 3);
    await clickOperation(t, '+');
    await clickNumButton(t, 2);
    await clickNumButton(t, 1);
    await clickEquals(t);

    expect(getCalcResult(), '24');
  });

  testWidgets('3 / 2 = 1.5', (WidgetTester t) async {
    await pump(t);

    await clickNumButton(t, 3);
    await clickOperation(t, '÷');
    await clickNumButton(t, 2);
    await clickEquals(t);

    expect(getCalcResult(), '1.5');
  });

  testWidgets('-2 + 3 = 1', (WidgetTester t) async {
    await pump(t);

    await clickNumButton(t, 2);
    await t.tap(find.widgetWithText(Button, '±'));
    await clickOperation(t, '+');
    await clickNumButton(t, 3);
    await clickEquals(t);

    expect(getCalcResult(), '1');
  });
}

pump(WidgetTester t) async {
  await t.pumpWidget(MyApp());
}

clickNumButton(WidgetTester t, int numText) async {
  await t.tap(find.widgetWithText(Button, numText.toString()));
}

clickEquals(WidgetTester t) async {
  await t.tap(find.widgetWithText(LongButton, '='));
  await t.pump();
}

clickOperation(WidgetTester t, String operation) async {
  await t.tap(find.widgetWithText(OperationButton, operation));
  await t.pump();
}

String getCalcResult() {
  return (find.byKey(Key('result-key')).evaluate().single.widget as Text).data;
}
