import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/controller/ProfileController.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';
import 'package:onlabproject/view/components/MyButton.dart';
import 'package:onlabproject/view/components/MyForm.dart';

import '../Resource/StringResource.dart';
import '../page_data/MyFormViewModel.dart';
import 'components/MyBackground.dart';

class ProfileView extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final IProfileController profileController;
  final MyFormViewModel formData;

  ProfileView({Key key, this.profileController, this.formData})
      : super(key: key);

  _save(BuildContext context) {
    if (formData.validate()) {
      profileController.save();
    } else {
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(StringResource.SNACK_INVALID_DATA)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: formData.loseFocus,
        child: MyBackground(
          child: Center(
            child: Container(
              width: ScreenUtil().setWidth(600),
              height: ScreenUtil.screenHeightDp,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.statusBarHeight +
                          ScreenUtil().setHeight(40),
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
                          onTap: () async {
                            await MyFirebaseAuthService.signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthController()),
                            );
                          },
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
                    MyForm(
                      viewModel: formData,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenUtil().setHeight(80)),
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
                        onPressed: () {
                          _save(context);
                        },
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
