import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MyBackground extends StatelessWidget {
  final Widget child;

  MyBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeightDp,
      width: ScreenUtil.screenWidthDp,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: ScreenUtil.screenHeightDp,
        width: ScreenUtil.screenWidthDp,
        decoration: BoxDecoration(
          color: Color.fromARGB(127, 255, 115, 0),
        ),
        child: child,
      ),
    );
  }
}