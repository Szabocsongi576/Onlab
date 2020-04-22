import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/converter/TransferListItemStateConverter.dart';
import 'package:onlabproject/model/TransferListItemData.dart';

class TransferListItem extends StatelessWidget {
  final TransferListItemData data;

  TransferListItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 220, 200),
        borderRadius:
            BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20))),
      ),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Cím:  " + data.address,
                    style: TextStyle(
                      fontSize:
                          ScreenUtil().setSp(40, allowFontScalingSelf: true),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dátum:  " + data.date.toString().split(" ")[0],
                    style: TextStyle(
                      fontSize:
                          ScreenUtil().setSp(30, allowFontScalingSelf: true),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setWidth(15)),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {}, //TODO
                  child: Text(
                    TransferListItemStateConverter.getStringFromEnumValue(
                        data.state),
                    style: TextStyle(
                      fontSize:
                          ScreenUtil().setSp(40, allowFontScalingSelf: true),
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
