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
            color: Color(0xff555a60),
          ),
          child: Text(
            sym,
            style: TextStyle(
              fontSize: 32,
              color: Color(0xffE3E9EC),
            ),
          ),
        ));
  }
}

class SecondaryButton extends StatelessWidget {
  final onPressed;
  final sym;
  SecondaryButton({Key key, this.onPressed, this.sym}) : super(key: key);

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
            color: Color(0xff6D6A65),
          ),
          child: Text(
            sym,
            style: TextStyle(
              fontSize: 32,
              color: Color(0xfff4ab41),
            ),
          ),
        ));
  }
}

class LongButton extends StatelessWidget {
  final onPressed;
  final sym;
  LongButton({Key key, this.onPressed, this.sym}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.fromLTRB(77, 17, 10, 10),
          width: 175,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37),
            color: Color(0xff6D6A65),
          ),
          child: Text(
            sym,
            style: TextStyle(
              fontSize: 32,
              color: Color(0xfff4ab41),
            ),
          ),
        ));
  }
}
