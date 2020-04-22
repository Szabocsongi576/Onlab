import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MyButton extends StatelessWidget {
  final double width;
  final Text text;
  final Function onPressed;


  MyButton({this.width = double.infinity, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width,
      height: ScreenUtil().setHeight(100),
      child: FlatButton(
        color: Color.fromARGB(255, 255, 115, 0),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(ScreenUtil().setWidth(15)),
            side: BorderSide(color: Colors.white)),
        child: text,
        onPressed: onPressed,
      ),
    );
  }
}