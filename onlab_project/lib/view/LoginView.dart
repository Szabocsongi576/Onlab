import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/page_data/LoginData.dart';
import 'package:onlabproject/view/components/MyBackground.dart';
import 'package:onlabproject/view/components/MyButton.dart';
import 'package:onlabproject/view/components/MyTextField.dart';

class LoginView extends StatelessWidget {
  final IAuthController authController;
  final LoginData data;

  const LoginView({Key key, this.authController, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: data.loseFocus,
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
                      child: MyTextField(
                        controller: data.emailController,
                        focusNode: data.emailFocus,
                        labelText: StringResource.LOGIN_EMAIL_LABEL,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(30)),
                      child: MyTextField(
                        controller: data.passwordController,
                        focusNode: data.passwordFocus,
                        obscureText: true,
                        labelText: StringResource.LOGIN_PASSWORD_LABEL,
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
                          Observer(
                            builder: (_) => Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Colors.white,
                              ),
                              child: Checkbox(
                                value: data.rememberMe,
                                activeColor: Color.fromARGB(255, 255, 115, 0),
                                checkColor: Colors.white,
                                onChanged: (value) {
                                  data.rememberMe = value;
                                },
                              ),
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
                          data.loseFocus();

                          authController.login();
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
                          data.loseFocus();
                          authController.stateChanged();
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
