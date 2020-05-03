import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/model/AuthData.dart';
import 'package:onlabproject/model/ProfileData.dart';
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
    String email =  widget.data.registerModel.textEditingControllerMap["email"].text;
    String password =  widget.data.registerModel.textEditingControllerMap["password"].text;
    ProfileData data = ProfileData(
      email:  widget.data.registerModel.textEditingControllerMap["email"].text,
      firstName:  widget.data.registerModel.textEditingControllerMap["firstName"].text,
      lastName:  widget.data.registerModel.textEditingControllerMap["lastName"].text,
      postalCode:  widget.data.registerModel.textEditingControllerMap["postalCode"].text,
      city:  widget.data.registerModel.textEditingControllerMap["city"].text,
      streetAndNum:  widget.data.registerModel.textEditingControllerMap["streetAndNum"].text,
      other:  widget.data.registerModel.textEditingControllerMap["other"].text,
      countryCode:  widget.data.registerModel.textEditingControllerMap["countryCode"].text,
      tel:  widget.data.registerModel.textEditingControllerMap["tel"].text,
    );

    print(data.toJson());

    widget.authController.register(
      email,
      password,
      data,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          widget.data.registerModel.focusNodeMap.forEach((key, value) =>  value.unfocus());
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
                          controller: widget.data.registerModel.textEditingControllerMap["email"],
                          focusNode: widget.data.registerModel.focusNodeMap["email"],
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
                          controller: widget.data.registerModel.textEditingControllerMap["password"],
                          focusNode: widget.data.registerModel.focusNodeMap["password"],
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
                          controller: widget.data.registerModel.textEditingControllerMap["firstName"],
                          focusNode: widget.data.registerModel.focusNodeMap["firstName"],
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
                          controller: widget.data.registerModel.textEditingControllerMap["lastName"],
                          focusNode: widget.data.registerModel.focusNodeMap["lastName"],
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
                          controller: widget.data.registerModel.textEditingControllerMap["postalCode"],
                          focusNode: widget.data.registerModel.focusNodeMap["postalCode"],
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
                          controller: widget.data.registerModel.textEditingControllerMap["city"],
                          focusNode: widget.data.registerModel.focusNodeMap["city"],
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
                          controller: widget.data.registerModel.textEditingControllerMap["streetAndNum"],
                          focusNode: widget.data.registerModel.focusNodeMap["streetAndNum"],
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
                          controller: widget.data.registerModel.textEditingControllerMap["other"],
                          focusNode: widget.data.registerModel.focusNodeMap["other"],
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
                                controller: widget.data.registerModel.textEditingControllerMap["countryCode"],
                                focusNode: widget.data.registerModel.focusNodeMap["countryCode"],
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
                                controller: widget.data.registerModel.textEditingControllerMap["tel"],
                                focusNode: widget.data.registerModel.focusNodeMap["tel"],
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
