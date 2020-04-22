
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/MyBackground.dart';

class TransferView extends StatefulWidget {
  @override
  _TransferViewState createState() => _TransferViewState();
}

class _TransferViewState extends State<TransferView> {
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