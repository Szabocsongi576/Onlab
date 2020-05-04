import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/page_data/AuthData.dart';
import 'package:onlabproject/view/components/MyBackground.dart';
import 'package:onlabproject/view/components/MyButton.dart';

class LoginView extends StatefulWidget {
  final IAuthController authController;
  final AuthData data;

  const LoginView({Key key, this.authController, this.data}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  _loseFocus() {
    widget.data.focusNodeMap["login_email"].unfocus();
    widget.data.focusNodeMap["login_password"].unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _loseFocus,
        child: SingleChildScrollView(
          child: MyBackground(
            child: Center(
              child: Container(
                width: ScreenUtil().setWidth(600),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.statusBarHeight +
                          ScreenUtil().setHeight(100),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(80)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            StringResource.LOGIN_TITLE,
                            style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(70, allowFontScalingSelf: true),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(30)),
                      child: TextField(
                        controller: widget.data.textEditingControllerMap["login_email"],
                        focusNode: widget.data.focusNodeMap["login_email"],
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: StringResource.LOGIN_EMAIL_LABEL,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil()
                                .setSp(30, allowFontScalingSelf: true),
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
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(30)),
                      child: TextField(
                        controller: widget.data.textEditingControllerMap["login_password"],
                        focusNode: widget.data.focusNodeMap["login_password"],
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: StringResource.LOGIN_PASSWORD_LABEL,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil()
                                .setSp(30, allowFontScalingSelf: true),
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
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            StringResource.LOGIN_REMEMBER_ME,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil()
                                    .setSp(30, allowFontScalingSelf: true)),
                          ),
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Colors.white,
                            ),
                            child: Checkbox(
                              value: widget.data.rememberMe,
                              activeColor: Color.fromARGB(255, 255, 115, 0),
                              checkColor: Colors.white,
                              onChanged: (bool value) {
                                setState(() {
                                  widget.data.rememberMe = value;
                                }); //TODO MOBX
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(50)),
                      child: MyButton(
                        text: Text(
                          StringResource.LOGIN_LOGIN_BUTTON_TEXT,
                          style: TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(40, allowFontScalingSelf: true),
                            color: Colors.white,
                          ),
                        ),
                        width: ScreenUtil().setWidth(450),
                        onPressed: () {
                          print("LoginPressed");
                          _loseFocus();

                          widget.authController.login();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(80)),
                      child: MyButton(
                        text: Text(
                          StringResource.LOGIN_REGISTER_BUTTON_TEXT,
                          style: TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(40, allowFontScalingSelf: true),
                            color: Colors.white,
                          ),
                        ),
                        width: ScreenUtil().setWidth(450),
                        onPressed: () {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );*/
                          _loseFocus();
                          widget.authController.stateChanged();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(50)),
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
    );
  }
}
