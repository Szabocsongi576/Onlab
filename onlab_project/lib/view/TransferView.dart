
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Resource/StringResource.dart';
import '../viewmodel/TransferViewModel.dart';
import 'OfferView.dart';
import 'components/MyBackground.dart';
import 'components/MyBackground.dart';
import 'components/MyButton.dart';
import 'components/TransferListItem.dart';
import 'components/TransferListItem.dart';

class TransferView extends StatefulWidget {
  @override
  _TransferViewState createState() => _TransferViewState();
}

class _TransferViewState extends State<TransferView> {
  TransferViewModel _transferViewModel = TransferViewModel();


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBackground(
        child: Center(
          child: Container(
            width: ScreenUtil().setWidth(700),
            height: ScreenUtil.screenHeightDp,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.statusBarHeight + ScreenUtil().setHeight(100),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          StringResource.TRANSFER_TITLE.toUpperCase(),
                          style: TextStyle(
                            fontSize:
                            ScreenUtil().setSp(60, allowFontScalingSelf: true),
                            letterSpacing: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(80)),
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: _transferViewModel.transferList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(ScreenUtil().setHeight(15)),
                        child: TransferListItem(_transferViewModel.transferList[index]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(80)),
                    child: MyButton(
                      text: Text(
                        StringResource.TRANSFER_NEW_BUTTON_TEXT,
                        style: TextStyle(
                          fontSize:
                          ScreenUtil().setSp(35, allowFontScalingSelf: true),
                          color: Colors.white,
                        ),
                      ),
                      width: ScreenUtil().setWidth(450),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OfferView()));
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}