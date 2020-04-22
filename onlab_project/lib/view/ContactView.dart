
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'components/MyBackground.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBackground(
        child: SingleChildScrollView(
          child: Container(
            width: ScreenUtil().setWidth(600),
            child: Column(
              children: <Widget>[

              ],
            ),
          ),
        ),
      ),
    );
  }
}