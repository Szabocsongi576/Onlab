
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/controller/ProfileController.dart';
import 'package:onlabproject/controller/ProfileViewModel.dart';
import 'package:onlabproject/model/ProfileData.dart';
import 'package:onlabproject/view/components/MyButton.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';

class ProfileView extends StatefulWidget {
  final IProfileController profileController;
  final ProfileViewModel profileViewModel;

  const ProfileView({Key key, this.profileController, this.profileViewModel}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  _save() {
    ProfileData data = ProfileData(
      email:  widget.profileViewModel.textEditingControllerMap["email"].text,
      firstName:  widget.profileViewModel.textEditingControllerMap["firstName"].text,
      lastName:  widget.profileViewModel.textEditingControllerMap["lastName"].text,
      postalCode:  widget.profileViewModel.textEditingControllerMap["postalCode"].text,
      city:  widget.profileViewModel.textEditingControllerMap["city"].text,
      streetAndNum:  widget.profileViewModel.textEditingControllerMap["streetAndNum"].text,
      other:  widget.profileViewModel.textEditingControllerMap["other"].text,
      countryCode:  widget.profileViewModel.textEditingControllerMap["countryCode"].text,
      tel:  widget.profileViewModel.textEditingControllerMap["tel"].text,
    );

    widget.profileController.save(data);
  }

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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          child: Image.asset(
                            "assets/logout.png",
                            width: ScreenUtil().setHeight(55),
                            height: ScreenUtil().setHeight(55),
                          ),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => AuthController()),
                            );
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
                        controller: widget.profileViewModel.textEditingControllerMap["firstName"],
                        focusNode: widget.profileViewModel.focusNodeMap["firstName"],
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
                        controller: widget.profileViewModel.textEditingControllerMap["lastName"],
                        focusNode: widget.profileViewModel.focusNodeMap["lastName"],
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
                        controller: widget.profileViewModel.textEditingControllerMap["postalCode"],
                        focusNode: widget.profileViewModel.focusNodeMap["postalCode"],
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
                        controller: widget.profileViewModel.textEditingControllerMap["city"],
                        focusNode: widget.profileViewModel.focusNodeMap["city"],
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
                        controller: widget.profileViewModel.textEditingControllerMap["streetAndNum"],
                        focusNode: widget.profileViewModel.focusNodeMap["streetAndNum"],
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
                        controller: widget.profileViewModel.textEditingControllerMap["other"],
                        focusNode: widget.profileViewModel.focusNodeMap["other"],
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
                              controller: widget.profileViewModel.textEditingControllerMap["countryCode"],
                              focusNode: widget.profileViewModel.focusNodeMap["countryCode"],
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
                              controller: widget.profileViewModel.textEditingControllerMap["tel"],
                              focusNode: widget.profileViewModel.focusNodeMap["tel"],
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
                    /*Padding(
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
                    ),*/ //TODO email edit
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
                        onPressed: _save(),
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