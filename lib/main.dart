import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: '',
      home: Calculator(),
    );
  }
}
