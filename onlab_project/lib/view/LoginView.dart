import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/page_data/LoginViewModel.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';
import 'package:onlabproject/view/components/MyBackground.dart';
import 'package:onlabproject/view/components/MyButton.dart';
import 'package:onlabproject/view/components/MyTextField.dart';

import 'TabView.dart';

class LoginView extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Function stateChanged;
  final LoginViewModel viewModel;

  LoginView({Key key, this.stateChanged, this.viewModel}) : super(key: key);

  void changeState() {
    viewModel.loseFocus();
    stateChanged();
  }

  Future<void> login(BuildContext context) async {
    viewModel.loseFocus();

    switch(await viewModel.login()) {
      case AuthResponse.LoggedIn:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TabView()),
        );
        break;
      case AuthResponse.NetworkError:
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(StringResource.SNACK_LOGIN_NETWORK_ERROR)));
        break;
      case AuthResponse.PasswordNotValid:
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(StringResource.SNACK_LOGIN_PASSWORD_NOT_VALID)));
        break;
      case AuthResponse.UserNotFound:
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(StringResource.SNACK_LOGIN_USER_NOT_FOUND)));
        break;
      default:
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(StringResource.SNACK_LOGIN_FAILED)));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: viewModel.loseFocus,
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
                        controller: viewModel.emailController,
                        focusNode: viewModel.emailFocus,
                        labelText: StringResource.LOGIN_EMAIL_LABEL,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(30)),
                      child: MyTextField(
                        controller: viewModel.passwordController,
                        focusNode: viewModel.passwordFocus,
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
                                value: viewModel.rememberMe,
                                activeColor: Color.fromARGB(255, 255, 115, 0),
                                checkColor: Colors.white,
                                onChanged: (value) {
                                  viewModel.rememberMe = value;
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
                        onPressed: () { login(context); },
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
                        onPressed: changeState,
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
