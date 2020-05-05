import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/page_data/AuthData.dart';
import 'package:onlabproject/view/components/MyBackground.dart';
import 'package:onlabproject/view/components/MyButton.dart';

class RegisterView extends StatefulWidget {
  final IAuthController authController;
  final AuthData data;

  const RegisterView({Key key, this.authController, this.data}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  _register() {
    if(_validate()) {
      widget.authController.register();
    } else {
      //TODO ERROR snackbar
    }
  }

  bool _validate() {
    String password = widget.data.textEditingControllerMap["password"].text;
    String email = widget.data.textEditingControllerMap["email"].text;
    String firstName = widget.data.textEditingControllerMap["firstName"].text;
    String lastName = widget.data.textEditingControllerMap["lastName"].text;
    String postalCode = widget.data.textEditingControllerMap["postalCode"].text;
    String city = widget.data.textEditingControllerMap["city"].text;
    String streetAndNum = widget.data.textEditingControllerMap["streetAndNum"].text;
    String countryCode = widget.data.textEditingControllerMap["countryCode"].text;
    String tel = widget.data.textEditingControllerMap["tel"].text;

    if(password.length < 6) {
      widget.data.errorMap["password"] = true;
    }
    if(email.length < 5 || !email.contains("@") || !email.contains(".")) {
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

    setState(() {});

    return widget.data.errorMap.containsValue(true) ? false : true;
  }


  @override
  void initState() {
    super.initState();

    widget.data.focusNodeMap["email"].addListener(() {
      if(widget.data.focusNodeMap["email"].hasFocus)
        widget.data.errorMap["email"] = false;
    });
    widget.data.focusNodeMap["password"].addListener(() {
      if(widget.data.focusNodeMap["password"].hasFocus)
        widget.data.errorMap["password"] = false;
    });
    widget.data.focusNodeMap["firstName"].addListener(() {
      if(widget.data.focusNodeMap["firstName"].hasFocus)
        widget.data.errorMap["firstName"] = false;
      setState(() { });
    });
    widget.data.focusNodeMap["lastName"].addListener(() {
      if(widget.data.focusNodeMap["lastName"].hasFocus)
        widget.data.errorMap["lastName"] = false;
      setState(() { });
    });
    widget.data.focusNodeMap["postalCode"].addListener(() {
      if(widget.data.focusNodeMap["postalCode"].hasFocus)
        widget.data.errorMap["postalCode"] = false;
      setState(() { });
    });
    widget.data.focusNodeMap["city"].addListener(() {
      if(widget.data.focusNodeMap["city"].hasFocus)
        widget.data.errorMap["city"] = false;
      setState(() { });
    });
    widget.data.focusNodeMap["streetAndNum"].addListener(() {
      if(widget.data.focusNodeMap["streetAndNum"].hasFocus)
        widget.data.errorMap["streetAndNum"] = false;
      setState(() { });
    });
    widget.data.focusNodeMap["countryCode"].addListener(() {
      if(widget.data.focusNodeMap["countryCode"].hasFocus)
        widget.data.errorMap["countryCode"] = false;
      setState(() { });
    });
    widget.data.focusNodeMap["tel"].addListener(() {
      if(widget.data.focusNodeMap["tel"].hasFocus)
        widget.data.errorMap["tel"] = false;
      setState(() { });
    });
    //TODO MOBX
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          widget.data.focusNodeMap.forEach((key, value) =>  value.unfocus());
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
                                widget.authController.stateChanged();
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

                      /*Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: widget.data.registerModel.textEditingControllerMap["username"],
                          focusNode: widget.data.registerModel.focusNodeMap["username"],
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
                      ),*/
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: widget.data.textEditingControllerMap["email"],
                          focusNode: widget.data.focusNodeMap["email"],
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
                            errorText: widget.data.errorMap["email"]
                                ? StringResource.FORM_FIELD_ERROR_TEXT_EMAIL
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.black,
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                        child: TextField(
                          controller: widget.data.textEditingControllerMap["password"],
                          focusNode: widget.data.focusNodeMap["password"],
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
                            errorText: widget.data.errorMap["password"]
                                ? StringResource.FORM_FIELD_ERROR_TEXT_PASS
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.black,
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          ),
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
                            errorText: widget.data.errorMap["firstName"]
                                ? StringResource.FORM_FIELD_ERROR_TEXT
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.black,
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
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
                            errorText: widget.data.errorMap["lastName"]
                                ? StringResource.FORM_FIELD_ERROR_TEXT
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.black,
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
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
                            errorText: widget.data.errorMap["postalCode"]
                                ? StringResource.FORM_FIELD_ERROR_TEXT
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.black,
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
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
                            errorText: widget.data.errorMap["city"]
                                ? StringResource.FORM_FIELD_ERROR_TEXT
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.black,
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
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
                            errorText: widget.data.errorMap["streetAndNum"]
                                ? StringResource.FORM_FIELD_ERROR_TEXT
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.black,
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
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
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(80)),
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
                                  errorText: widget.data.errorMap["countryCode"]
                                      ? StringResource.FORM_FIELD_ERROR_TEXT_COUNTRY_CODE
                                      : null,
                                  errorStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)),
                                  focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)),
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
                                  errorText: widget.data.errorMap["tel"]
                                      ? StringResource.FORM_FIELD_ERROR_TEXT
                                      : null,
                                  errorStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)),
                                  focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)),
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
                          onPressed: () {
                            print("register lap");
                            _register();
                          },
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
