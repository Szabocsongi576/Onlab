
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/page_data/TransferFlowData.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';
import 'components/MyButton.dart';

class ConnectionDataView extends StatefulWidget {
  final TransferFlowData data;
  final Function onPageChanged;

  const ConnectionDataView({Key key, this.data, this.onPageChanged}) : super(key: key);

  @override
  _ConnectionDataViewState createState() => _ConnectionDataViewState();
}

class _ConnectionDataViewState extends State<ConnectionDataView> {

  @override
  void initState() {
    super.initState();

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
                  /*SizedBox(
                    height: ScreenUtil.statusBarHeight + ScreenUtil().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset(
                          "assets/left-arrow.png",
                          width: ScreenUtil().setHeight(55),
                          height: ScreenUtil().setHeight(55),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        }, //TODO
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(600),
                          child: Text(
                            StringResource.TF1_TITLE,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(60, allowFontScalingSelf: true),
                              letterSpacing: 1.2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),*/
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.white,
                          ),
                          child: Checkbox(
                            value: false, //TODO
                            activeColor: Color.fromARGB(255, 255, 115, 0),
                            checkColor: Colors.white,
                            onChanged: (bool value) {
                              //TODO
                            },
                          ),
                        ),
                        Text(
                          StringResource.CDV_USE_PROFILE_DATA_CB_TEXT,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                              ScreenUtil().setSp(35, allowFontScalingSelf: true)),
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

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(50)),
                    child: MyButton(
                      width: ScreenUtil().setWidth(400),
                      text: Text(
                        StringResource.TF_NEXT_PAGE_BUTTON_TEXT,
                        style: TextStyle(
                          fontSize:
                          ScreenUtil().setSp(40, allowFontScalingSelf: true),
                          color: Colors.white,
                        ),
                      ),
                      onPressed: widget.onPageChanged,
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