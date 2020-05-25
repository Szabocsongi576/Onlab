import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/page_data/ProfileViewModel.dart';
import 'package:onlabproject/view/components/MyButton.dart';
import 'package:onlabproject/view/components/MyForm.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';

class ProfileView extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ProfileViewModel viewModel;

  ProfileView({Key key, this.viewModel})
      : super(key: key);

  _save(BuildContext context) {
    if (viewModel.formViewModel.validate()) {
      viewModel.save();
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
        onTap: viewModel.formViewModel.loseFocus,
        child: Stack(
          children: <Widget>[
            MyBackground(
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
                              onTap: () { viewModel.signOut(); },
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
                          viewModel: viewModel.formViewModel,
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
            Observer(
              builder: (_) => viewModel.loading
                  ? Container(
                child: Container(
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10.0)),
                    width: ScreenUtil().setWidth(400),
                    height: ScreenUtil().setHeight(400),
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: SizedBox(
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setWidth(100),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                  Color.fromARGB(127, 255, 115, 0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
