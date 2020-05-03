
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/converter/TransferListItemStateConverter.dart';
import 'package:onlabproject/model/TransferListItemData.dart';
import 'package:onlabproject/view/components/MyButton.dart';

import 'components/MyBackground.dart';

class OfferView extends StatefulWidget {
  final TransferListItemData data;

  const OfferView({Key key, this.data}) : super(key: key);

  @override
  _OfferViewState createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: MyBackground(
        child: Center(
          child: Container(
            width: ScreenUtil().setWidth(600),
            height: ScreenUtil.screenHeightDp,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.statusBarHeight + ScreenUtil().setHeight(40),
                  ),
                  Row(
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
                        }, //TODO
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          StringResource.OFFER_TITLE.toUpperCase(),
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
                  Container(
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
                                  StringResource.OFFER_ADDR,
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
                            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(50), 0, 0, ScreenUtil().setHeight(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.data.address,
                                  style: TextStyle(
                                    fontSize:
                                    ScreenUtil().setSp(35, allowFontScalingSelf: true),
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  StringResource.OFFER_DATE,
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
                            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(50), 0, 0, ScreenUtil().setHeight(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.data.date.toString().split(" ")[0],
                                  style: TextStyle(
                                    fontSize:
                                    ScreenUtil().setSp(35, allowFontScalingSelf: true),
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  StringResource.OFFER_TIME,
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
                            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(50), 0, 0, ScreenUtil().setHeight(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.data.date.hour.toString() + ":" +  widget.data.date.minute.toString(),
                                  style: TextStyle(
                                    fontSize:
                                    ScreenUtil().setSp(35, allowFontScalingSelf: true),
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  StringResource.OFFER_DESC,
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
                            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(50), 0, 0, ScreenUtil().setHeight(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.data.description.toString(),
                                  style: TextStyle(
                                    fontSize:
                                    ScreenUtil().setSp(35, allowFontScalingSelf: true),
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  StringResource.OFFER_PRICE,
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
                            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(50), 0, 0, ScreenUtil().setHeight(60)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.data.price.toString() + " Ft",
                                  style: TextStyle(
                                    fontSize:
                                    ScreenUtil().setSp(35, allowFontScalingSelf: true),
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              MyButton(
                                  width: ScreenUtil().setWidth(200),
                                  text: Text(
                                    StringResource.OFFER_ACCEPT_BUTTON_TEXT,
                                    style: TextStyle(
                                      fontSize: ScreenUtil()
                                          .setSp(35, allowFontScalingSelf: true),
                                      letterSpacing: 1.2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {} //TODO,
                              ),
                              MyButton(
                                  width: ScreenUtil().setWidth(200),
                                  text: Text(
                                    StringResource.OFFER_DENIE_BUTTON_TEXT,
                                    style: TextStyle(
                                      fontSize: ScreenUtil()
                                          .setSp(35, allowFontScalingSelf: true),
                                      letterSpacing: 1.2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {} //TODO,
                              ),
                            ],
                          ),
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