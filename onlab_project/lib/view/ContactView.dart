import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/controller/ContactController.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';

class ContactView extends StatelessWidget {
  final IContactController controller;

  const ContactView({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBackground(
        child: Center(
          child: Container(
            width: ScreenUtil().setWidth(600),
            height: ScreenUtil.screenHeightDp,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.statusBarHeight +
                        ScreenUtil().setHeight(100),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(120)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          StringResource.CONTACT_TITLE.toUpperCase(),
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
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(120)),
                    child: Text(
                      StringResource.CONTACT_DESC,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize:
                            ScreenUtil().setSp(40, allowFontScalingSelf: true),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(60)),
                    child: GestureDetector(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            "assets/baseline_email_white_18dp.png",
                            width: ScreenUtil().setWidth(80),
                            height: ScreenUtil().setWidth(80),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(30),
                          ),
                          Text(
                            StringResource.CONTACT_EMAIL,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: ScreenUtil()
                                  .setSp(30, allowFontScalingSelf: true),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        this.controller.launchEmail(StringResource.CONTACT_EMAIL);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(60)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          "assets/baseline_local_phone_white_18dp.png",
                          width: ScreenUtil().setWidth(80),
                          height: ScreenUtil().setWidth(80),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(30),
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                                child: Text(
                                  StringResource.CONTACT_TEL1,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: ScreenUtil()
                                        .setSp(30, allowFontScalingSelf: true),
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  this.controller.launchPhone(StringResource.CONTACT_TEL1);
                                },
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(30),
                            ),
                            GestureDetector(
                                child: Text(
                                  StringResource.CONTACT_TEL2,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: ScreenUtil()
                                        .setSp(30, allowFontScalingSelf: true),
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  this.controller.launchPhone(StringResource.CONTACT_TEL2);
                                },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(60)),
                    child: GestureDetector(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            "assets/facebook-3-48.png",
                            width: ScreenUtil().setWidth(70),
                            height: ScreenUtil().setWidth(70),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(30),
                          ),
                          Text(
                            StringResource.CONTACT_FB,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: ScreenUtil()
                                  .setSp(30, allowFontScalingSelf: true),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {
                        await controller.launchFacebook(StringResource.CONTACT_FB);
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
