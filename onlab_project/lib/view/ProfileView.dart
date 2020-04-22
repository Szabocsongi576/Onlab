
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'components/MyBackground.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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