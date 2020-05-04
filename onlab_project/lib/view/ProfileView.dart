
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/controller/ProfileController.dart';
import 'package:onlabproject/page_data/ProfileData.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/view/components/MyButton.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';

class ProfileView extends StatefulWidget {
  final IProfileController profileController;
  final ProfileData data;

  const ProfileView({Key key, this.profileController, this.data}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  _save() {
    if(_validate()) {
      ProfileModel data = ProfileModel(
        email:  widget.data.textEditingControllerMap["email"].text,
        firstName:  widget.data.textEditingControllerMap["firstName"].text,
        lastName:  widget.data.textEditingControllerMap["lastName"].text,
        postalCode:  widget.data.textEditingControllerMap["postalCode"].text,
        city:  widget.data.textEditingControllerMap["city"].text,
        streetAndNum:  widget.data.textEditingControllerMap["streetAndNum"].text,
        other:  widget.data.textEditingControllerMap["other"].text,
        countryCode:  widget.data.textEditingControllerMap["countryCode"].text,
        tel:  widget.data.textEditingControllerMap["tel"].text,
      );

      widget.profileController.save(data);
    } else {
      //TODO ERROR snackbar
    }
  }

  bool _validate() {
    String email = widget.data.textEditingControllerMap["email"].text;
    String firstName = widget.data.textEditingControllerMap["firstName"].text;
    String lastName = widget.data.textEditingControllerMap["lastName"].text;
    String postalCode = widget.data.textEditingControllerMap["postalCode"].text;
    String city = widget.data.textEditingControllerMap["city"].text;
    String streetAndNum = widget.data.textEditingControllerMap["streetAndNum"].text;
    String countryCode = widget.data.textEditingControllerMap["countryCode"].text;
    String tel = widget.data.textEditingControllerMap["tel"].text;

    if(email.length < 5 && !email.contains("@") && !email.contains(".")) {
      widget.data.errorMap["email"] = true;
    }
    if(firstName.length == 0) {
      widget.data.errorMap["firstName"] = true;
    }
    if(lastName.length == 0) {
      widget.data.errorMap["lastName"] = true;
    }
    if(postalCode.length == 0) {
      widget.data.errorMap["postalCode"] = true;
    }
    if(city.length == 0) {
      widget.data.errorMap["city"] = true;
    }
    if(streetAndNum.length == 0) {
      widget.data.errorMap["streetAndNum"] = true;
    }
    if(countryCode.length == 0) {
      widget.data.errorMap["countryCode"] = true;
    }
    if(tel.length < 6) {
      widget.data.errorMap["tel"] = true;
    }

    return widget.data.errorMap.containsValue(true) ? false : true;
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
                        controller: widget.data.textEditingControllerMap["firstName"],
                        focusNode: widget.data.focusNodeMap["firstName"],
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
                        controller: widget.data.textEditingControllerMap["lastName"],
                        focusNode: widget.data.focusNodeMap["lastName"],
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
                        controller: widget.data.textEditingControllerMap["postalCode"],
                        focusNode: widget.data.focusNodeMap["postalCode"],
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
                        controller: widget.data.textEditingControllerMap["city"],
                        focusNode: widget.data.focusNodeMap["city"],
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
                        controller: widget.data.textEditingControllerMap["streetAndNum"],
                        focusNode: widget.data.focusNodeMap["streetAndNum"],
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
                        controller: widget.data.textEditingControllerMap["other"],
                        focusNode: widget.data.focusNodeMap["other"],
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
                              controller: widget.data.textEditingControllerMap["countryCode"],
                              focusNode: widget.data.focusNodeMap["countryCode"],
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
                              controller: widget.data.textEditingControllerMap["tel"],
                              focusNode: widget.data.focusNodeMap["tel"],
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