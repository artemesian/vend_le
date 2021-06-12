import 'package:flutter/material.dart';

class reusableButton extends StatelessWidget {
  reusableButton({
    @required this.text,
    @required this.color,
    @required this.width,
    @required this.textColor,
    @required this.function,
  });
  final String text;
  final Color color;
  final width;
  final Color textColor;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width,
      height: 40,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Color(0XFF885FBF)),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        onPressed: function,
      ),
    );
  }
}
