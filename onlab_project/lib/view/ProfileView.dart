
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/view/components/MyButton.dart';

import '../Resource/StringResource.dart';
import '../viewmodel/ContactViewModel.dart';
import '../viewmodel/ContactViewModel.dart';
import '../viewmodel/ProfileViewModel.dart';
import 'components/MyBackground.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileViewModel _profileViewModel = ProfileViewModel();

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
                    height: ScreenUtil.statusBarHeight + ScreenUtil().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset(
                          "assets/logout.png",
                          width: ScreenUtil().setHeight(55),
                          height: ScreenUtil().setHeight(55),
                        ),
                      onTap: () {}, //TODO
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
                          StringResource.PROFILE_TITLE.toUpperCase(),
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: TextField(
                      controller: _profileViewModel.textEditingControllerMap["firstName"],
                      focusNode: _profileViewModel.focusNodeMap["firstName"],
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
                      controller: _profileViewModel.textEditingControllerMap["lastName"],
                      focusNode: _profileViewModel.focusNodeMap["lastName"],
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
                      controller: _profileViewModel.textEditingControllerMap["postalCode"],
                      focusNode: _profileViewModel.focusNodeMap["postalCode"],
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
                      controller: _profileViewModel.textEditingControllerMap["city"],
                      focusNode: _profileViewModel.focusNodeMap["city"],
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
                      controller: _profileViewModel.textEditingControllerMap["streetAndNum"],
                      focusNode: _profileViewModel.focusNodeMap["streetAndNum"],
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
                      controller: _profileViewModel.textEditingControllerMap["other"],
                      focusNode: _profileViewModel.focusNodeMap["other"],
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(190),
                          child: TextField(
                            controller: _profileViewModel.textEditingControllerMap["countryCode"],
                            focusNode: _profileViewModel.focusNodeMap["countryCode"],
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
                            controller: _profileViewModel.textEditingControllerMap["tel"],
                            focusNode: _profileViewModel.focusNodeMap["tel"],
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(80)),
                    child: TextField(
                      controller: _profileViewModel.textEditingControllerMap["email"],
                      focusNode: _profileViewModel.focusNodeMap["email"],
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(80)),
                    child: MyButton(
                      width: ScreenUtil().setWidth(450),
                      text: Text(
                        StringResource.PROFILE_SAVE_BUTTON_TEXT,
                        style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(35, allowFontScalingSelf: true),
                          letterSpacing: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {} //TODO,
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