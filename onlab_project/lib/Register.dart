import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/model/RegisterModel.dart';
import 'package:onlabproject/view/components/MyBackground.dart';
import 'package:onlabproject/view/components/MyButton.dart';

import 'Login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  RegisterModel _model = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _model.focusNodeMap.forEach((key, value) =>  value.unfocus());
        },
        child: SingleChildScrollView(
          child: MyBackground(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: ScreenUtil().setWidth(600),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.statusBarHeight + ScreenUtil().setHeight(30),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: Container(
                                width: ScreenUtil().setWidth(60),
                                height: ScreenUtil().setWidth(60),
                                child: Image.asset("assets/left-arrow.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(80)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              StringResource.REGISTER_TITLE,
                              style: TextStyle(
                                fontSize:
                                ScreenUtil().setSp(70, allowFontScalingSelf: true),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: _model.textEditingControllerMap["username"],
                          focusNode: _model.focusNodeMap["username"],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: StringResource.REGISTER_USERNAME_LABEL,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: _model.textEditingControllerMap["password"],
                          focusNode: _model.focusNodeMap["password"],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: StringResource.REGISTER_PASSWORD_LABEL,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: _model.textEditingControllerMap["email"],
                          focusNode: _model.focusNodeMap["email"],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: StringResource.REGISTER_EMAIL_LABEL,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: _model.textEditingControllerMap["firstName"],
                          focusNode: _model.focusNodeMap["firstName"],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: StringResource.REGISTER_FIRST_NAME_LABEL,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: _model.textEditingControllerMap["lastName"],
                          focusNode: _model.focusNodeMap["lastName"],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: StringResource.REGISTER_LAST_NAME_LABEL,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: _model.textEditingControllerMap["postalCode"],
                          focusNode: _model.focusNodeMap["postalCode"],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: StringResource.REGISTER_POSTAL_CODE_LABEL,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: _model.textEditingControllerMap["city"],
                          focusNode: _model.focusNodeMap["city"],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: StringResource.REGISTER_CITY_LABEL,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: _model.textEditingControllerMap["streetAndNum"],
                          focusNode: _model.focusNodeMap["streetAndNum"],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: StringResource.REGISTER_STREET_AND_NUM_LABEL,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: _model.textEditingControllerMap["other"],
                          focusNode: _model.focusNodeMap["other"],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: StringResource.REGISTER_OTHER_LABEL,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(80)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: ScreenUtil().setWidth(190),
                              child: TextField(
                                controller: _model.textEditingControllerMap["countryCode"],
                                focusNode: _model.focusNodeMap["countryCode"],
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: StringResource.REGISTER_COUNTRY_CODE_LABEL,
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(390),
                              child: TextField(
                                controller: _model.textEditingControllerMap["tel"],
                                focusNode: _model.focusNodeMap["tel"],
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: StringResource.REGISTER_TEL_LABEL,
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(30, allowFontScalingSelf: true),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(50)),
                        child: MyButton(
                          width: ScreenUtil().setWidth(400),
                          text: Text(
                            StringResource.LOGIN_REGISTER_BUTTON_TEXT,
                            style: TextStyle(
                              fontSize:
                              ScreenUtil().setSp(40, allowFontScalingSelf: true),
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {}, //TODO
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(50)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/logo_milcomp.png",
                            width: ScreenUtil().setWidth(250),
                            height: ScreenUtil().setWidth(250),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
