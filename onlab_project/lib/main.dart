import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/page_data/MyFormData.dart';
import 'package:onlabproject/view/components/MyForm.dart';

Future<void> main() async {
  runApp(MyApp());
}

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
    return AuthController();
  }
}