import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final onPressed;
  final sym;
  Button({Key key, this.onPressed, this.sym}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.fromLTRB(27, 17, 10, 10),
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37),
            color: Colors.grey,
          ),
          child: Text(
            sym,
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ));
  }
}
