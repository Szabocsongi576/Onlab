import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/page_data/RegisterViewModel.dart';
import 'package:onlabproject/view/TabView.dart';
import 'package:onlabproject/view/components/MyBackground.dart';
import 'package:onlabproject/view/components/MyButton.dart';
import 'package:onlabproject/view/components/MyForm.dart';

class RegisterView extends StatelessWidget {
  final Function stateChanged;
  final RegisterViewModel viewModel;

  RegisterView({this.viewModel, this.stateChanged});

  _register(BuildContext context) async {
    viewModel.formViewModel.loseFocus();
    if(viewModel.formViewModel.validate()) {
      bool succeed = await viewModel.register();
      if (succeed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TabView()),
        );
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(StringResource.SNACK_REGISTER_FAILED)));
      }
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(StringResource.SNACK_INVALID_DATA)));
    }
  }

  _changeState() {
    viewModel.formViewModel.loseFocus();
    stateChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: viewModel.formViewModel.loseFocus,
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
                              onTap: _changeState,
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
                      MyForm(
                        viewModel: viewModel.formViewModel,
                        emailActive: true,
                        passwordActive: true,
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
                          onPressed: () { _register(context); },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(50)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/ic_icon.png",
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
