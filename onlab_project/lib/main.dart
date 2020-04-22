import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        context,
        width: 750,
        height: 1500,
        allowFontScaling: true);
    return Login();
  }
}