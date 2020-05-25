import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/service/TransferListItemConvertService.dart';
import 'package:onlabproject/model/TransferItemModel.dart';

class TransferListItem extends StatelessWidget {
  final TransferItemModel data;

  TransferListItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: Color.fromARGB(255, 255, 220, 200),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Text(
                      data.address,
                      style: TextStyle(
                        fontSize: ScreenUtil()
                            .setSp(40, allowFontScalingSelf: true),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      data.date.toString().split(" ")[0] +
                          "\n" +
                          data.timeInterval,
                      style: TextStyle(
                        fontSize: ScreenUtil()
                            .setSp(30, allowFontScalingSelf: true),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: TransferListItemConvertService.getSStatusBarColorByState(
                data.state),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(30),
                  vertical: ScreenUtil().setHeight(20)),
              child: Text(
                TransferListItemConvertService.getStringFromEnumValue(data.state),
                style: TextStyle(
                  fontSize:
                      ScreenUtil().setSp(30, allowFontScalingSelf: true),
                  fontWeight: FontWeight.bold,
                  color: TransferListItemConvertService
                      .getSStatusBarTextColorByState(data.state),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
