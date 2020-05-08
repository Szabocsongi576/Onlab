import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool enabled;
  final bool isError;
  final bool obscureText;
  final String labelText;
  final String errorText;
  final TextInputType keyboardType;
  final int maxLines;


  const MyTextField({
    Key key,
    @required this.controller,
    @required this.focusNode,
    this.enabled = true,
    this.isError = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.labelText,
    this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      keyboardType: keyboardType,
      maxLines: maxLines,
      enabled: enabled,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText ?? labelText,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorText: isError ? errorText : null,
        errorStyle: TextStyle(
          color: Colors.black,
        ),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedErrorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
