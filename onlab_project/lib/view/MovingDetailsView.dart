import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/service/MovingListItemConvertService.dart';
import 'package:onlabproject/model/MovingItemModel.dart';
import 'package:onlabproject/view/components/MyButton.dart';
import 'package:onlabproject/view/components/ObjectListItemView.dart';

import 'components/MyBackground.dart';

class MovingDetailsView extends StatelessWidget {
  final MovingItemModel model;
  final Function onAccept;
  final Function onDeny;

  MovingDetailsView({@required this.model, this.onAccept, this.onDeny});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: MyBackground(
        child: Center(
          child: Container(
            width: ScreenUtil.screenHeightDp,
            height: ScreenUtil.screenHeightDp,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: ScreenUtil.statusBarHeight),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(50),
                        ScreenUtil().setHeight(40),
                        ScreenUtil().setWidth(50),
                        ScreenUtil().setWidth(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          child: Image.asset(
                            "assets/left-arrow.png",
                            width: ScreenUtil().setHeight(55),
                            height: ScreenUtil().setHeight(55),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          StringResource.MOVING_DETAILS_TITLE.toUpperCase(),
                          style: TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(60, allowFontScalingSelf: true),
                            letterSpacing: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(50), 0,
                        ScreenUtil().setWidth(50), ScreenUtil().setHeight(25)),
                    child: Container(
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
                            width: double.infinity,
                            color: MovingListItemConvertService
                                .getSStatusBarColorByState(model.state),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(30),
                                  vertical: ScreenUtil().setHeight(20)),
                              child: Text(
                                MovingListItemConvertService
                                    .getStringFromEnumValue(model.state),
                                style: TextStyle(
                                  fontSize: ScreenUtil()
                                      .setSp(30, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.bold,
                                  color: MovingListItemConvertService
                                      .getSStatusBarTextColorByState(
                                          model.state),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, 0, 0, ScreenUtil().setHeight(30)),
                                  child: Text(
                                    "Kapcsolattartási adatok",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(40,
                                          allowFontScalingSelf: true),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      ScreenUtil().setWidth(50), 0, 0, 0),
                                  child: Text(
                                    model.name + "\n" + model.tel + "\n",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(35,
                                          allowFontScalingSelf: true),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, 0, 0, ScreenUtil().setHeight(30)),
                                  child: Text(
                                    StringResource.OFFER_ADDR,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(40,
                                          allowFontScalingSelf: true),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      ScreenUtil().setWidth(50),
                                      0,
                                      0,
                                      ScreenUtil().setHeight(30)),
                                  child: Text(
                                    model.address,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(35,
                                          allowFontScalingSelf: true),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, 0, 0, ScreenUtil().setHeight(30)),
                                  child: Text(
                                    StringResource.OFFER_DATE,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(40,
                                          allowFontScalingSelf: true),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      ScreenUtil().setWidth(50),
                                      0,
                                      0,
                                      ScreenUtil().setHeight(30)),
                                  child: Text(
                                    model.date.toString().split(" ")[0],
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(35,
                                          allowFontScalingSelf: true),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, 0, 0, ScreenUtil().setHeight(30)),
                                  child: Text(
                                    StringResource.OFFER_TIME,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(40,
                                          allowFontScalingSelf: true),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    ScreenUtil().setWidth(50),
                                    0,
                                    0,
                                    (model.state ==
                                            MovingListItemState
                                                .OFFER_RECEIVED)
                                        ? ScreenUtil().setHeight(30)
                                        : 0,
                                  ),
                                  child: Text(
                                    model.timeInterval,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(35,
                                          allowFontScalingSelf: true),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                (model.state ==
                                        MovingListItemState.OFFER_RECEIVED)
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0,
                                                0, ScreenUtil().setHeight(30)),
                                            child: Text(
                                              StringResource.OFFER_DESC,
                                              style: TextStyle(
                                                fontSize: ScreenUtil().setSp(40,
                                                    allowFontScalingSelf: true),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                ScreenUtil().setWidth(50),
                                                0,
                                                0,
                                                ScreenUtil().setHeight(30)),
                                            child: Text(
                                              model.description.toString(),
                                              style: TextStyle(
                                                fontSize: ScreenUtil().setSp(35,
                                                    allowFontScalingSelf: true),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0,
                                                0, ScreenUtil().setHeight(30)),
                                            child: Text(
                                              StringResource.OFFER_PRICE,
                                              style: TextStyle(
                                                fontSize: ScreenUtil().setSp(40,
                                                    allowFontScalingSelf: true),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                ScreenUtil().setWidth(50),
                                                0,
                                                0,
                                                0),
                                            child: Text(
                                              model.price.toString() + " Ft",
                                              style: TextStyle(
                                                fontSize: ScreenUtil().setSp(35,
                                                    allowFontScalingSelf: true),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: model.objectList.length,
                              itemBuilder: (_, int index) {
                                return ObjectListItemView(
                                  model: model.objectList[index],
                                  imageFromURL: true,
                                );
                              },
                            ),
                          ),
                          (model.state == MovingListItemState.OFFER_RECEIVED)
                              ? Container(
                                  height: ScreenUtil().setHeight(150),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      MyButton(
                                          width: ScreenUtil().setWidth(200),
                                          text: Text(
                                            StringResource
                                                .OFFER_ACCEPT_BUTTON_TEXT,
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(35,
                                                  allowFontScalingSelf: true),
                                              letterSpacing: 1.2,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            onAccept();
                                            Navigator.pop(context);
                                          }),
                                      MyButton(
                                          width: ScreenUtil().setWidth(200),
                                          text: Text(
                                            StringResource
                                                .OFFER_DENY_BUTTON_TEXT,
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(35,
                                                  allowFontScalingSelf: true),
                                              letterSpacing: 1.2,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            onDeny();
                                            Navigator.pop(context);
                                          }),
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
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
