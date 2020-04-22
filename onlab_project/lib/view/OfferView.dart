
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'components/MyBackground.dart';

class OfferView extends StatefulWidget {
  @override
  _OfferViewState createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
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