import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final onPressed;
  final sym;
  Button({Key key, this.onPressed, this.sym}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: Text(
          sym,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ));
  }
}