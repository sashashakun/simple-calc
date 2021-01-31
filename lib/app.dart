import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'button.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  num firstNum;
  num secondNum;
  String operation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: _buildApp(),
    );
  }

  Widget _buildApp() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _getTextToRender(),
              style: TextStyle(
                fontSize: 34,
                color: Colors.black87,
              ),
              key: Key('result-key'),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(onPressed: () => _revertSign(), sym: '+/-'),
            Button(onPressed: () => _calcEqual(), sym: '='),
            Button(onPressed: () => _setOperation('/'), sym: '/'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(onPressed: () => _setNum(1), sym: '1'),
            Button(onPressed: () => _setNum(2), sym: '2'),
            Button(onPressed: () => _setNum(3), sym: '3'),
            Button(onPressed: () => _setOperation('+'), sym: '+'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(onPressed: () => _setNum(4), sym: '4'),
            Button(onPressed: () => _setNum(5), sym: '5'),
            Button(onPressed: () => _setNum(6), sym: '6'),
            Button(onPressed: () => _setOperation('-'), sym: '-'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(onPressed: () => _setNum(7), sym: '7'),
            Button(onPressed: () => _setNum(8), sym: '8'),
            Button(onPressed: () => _setNum(9), sym: '9'),
            Button(onPressed: () => _setOperation('*'), sym: '*'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(onPressed: () => _setNum(0), sym: '0'),
            Button(onPressed: () => _clearState(), sym: 'C'),
          ],
        ),
      ],
    ));
  }

  String _getTextToRender() {
    bool noNums = firstNum == null && secondNum == null;
    bool noSecondNum = firstNum != null && secondNum == null;

    if (noNums) return '';

    num result = noSecondNum ? firstNum : secondNum;
    
    return _isInteger(result) ? result.toInt().toString() : result.toString();
  }

  void _revertSign() {
    if (firstNum != null) {
      setState(() {
        firstNum = -firstNum;
      });
      return;
    }

    if (secondNum != null) {
      setState(() {
        secondNum = -secondNum;
      });
    }
  }

  void _calcEqual() {
    if (firstNum != null && secondNum != null && operation != '') {
      num result = _calculate(firstNum, secondNum, operation);

      setState(() {
        firstNum = result;
        operation = '';
        secondNum = null;
      });
    }
  }

  void _setOperation(String value) {
    if (firstNum != null && secondNum != null && operation != '') {
      num result = _calculate(firstNum, secondNum, operation);

      setState(() {
        firstNum = result;
        operation = value;
        secondNum = null;
      });
    } else {
      setState(() {
        operation = value;
      });
    }
  }

  void _clearState() {
    setState(() {
      firstNum = null;
      operation = '';
      secondNum = null;
    });
  }

  void _setNum(num value) {
    bool isLongFirstNum = firstNum != null && secondNum == null && operation == '';
    bool isLongSecondNum = firstNum != null && secondNum != null && operation != '';
    bool noSecondNum = firstNum != null && secondNum == null && operation != '';
    bool noFirstNum = firstNum == null;

    if (noFirstNum) {
      setState(() {
        firstNum = value;
      });
      return;
    }

    if (noSecondNum) {
      setState(() {
        secondNum = value;
      });
      return;
    }

    if (isLongFirstNum) {
      setState(() {
        firstNum = num.parse('$firstNum$value');
      });
      return;
    }

    if (isLongSecondNum) {
      setState(() {
        secondNum = num.parse('$secondNum$value');
      });
      return;
    }
  }

  num _calculate(num num1, num num2, String operation) {
    num res = 0;
    switch (operation) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        res = num1 / num2;
        break;
      default:
    }
    return res;
  }

  bool _isInteger(num a) => (a % 1) == 0;
}

