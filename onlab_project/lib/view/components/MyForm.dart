import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/page_data/MyFormData.dart';

class MyForm extends StatefulWidget {
  final MyFormData data;
  final bool emailActive;
  final bool passwordActive;
  final bool enableFields;

  const MyForm({
    Key key,
    this.data,
    this.emailActive = false,
    this.passwordActive = false,
    this.enableFields = true,
  }) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  bool validate() {
    String firstName = widget.data.textEditingControllerMap["firstName"].text;
    String lastName = widget.data.textEditingControllerMap["lastName"].text;
    String postalCode = widget.data.textEditingControllerMap["postalCode"].text;
    String city = widget.data.textEditingControllerMap["city"].text;
    String streetAndNum = widget.data.textEditingControllerMap["streetAndNum"].text;
    String countryCode = widget.data.textEditingControllerMap["countryCode"].text;
    String tel = widget.data.textEditingControllerMap["tel"].text;

    if(widget.passwordActive) {
      String password = widget.data.textEditingControllerMap["password"].text;
      if(password.length < 6) {
        widget.data.errorMap["password"] = true;
      }
    }
    if(widget.emailActive) {
      String email = widget.data.textEditingControllerMap["email"].text;
      if(email.length < 5 || !email.contains("@") || !email.contains(".")) {
        widget.data.errorMap["email"] = true;
      }
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

    /*if(widget.emailActive) {
      widget.data.focusNodeMap["email"].addListener(() {
        if(widget.data.focusNodeMap["email"].hasFocus)
          widget.data.errorMap["email"] = false;
      });
    }
    if(widget.passwordActive) {
      widget.data.focusNodeMap["password"].addListener(() {
        if(widget.data.focusNodeMap["password"].hasFocus)
          widget.data.errorMap["password"] = false;
      });
    }
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
    //TODO MOBX*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          widget.data.focusNodeMap.forEach((key, value) =>  value.unfocus());
        },
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: ScreenUtil().setWidth(600),
              child: Column(
                children: <Widget>[
                  widget.emailActive
                      ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: TextField(
                      controller: widget.data.textEditingControllerMap["email"],
                      focusNode: widget.data.focusNodeMap["email"],
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      enabled: widget.enableFields,
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
                  )
                      : Container(),
                  widget.passwordActive
                    ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: TextField(
                      controller: widget.data.textEditingControllerMap["password"],
                      focusNode: widget.data.focusNodeMap["password"],
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      enabled: widget.enableFields,
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
                  )
                    : Container(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: TextField(
                      controller: widget.data.textEditingControllerMap["firstName"],
                      focusNode: widget.data.focusNodeMap["firstName"],
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      enabled: widget.enableFields,
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
                      enabled: widget.enableFields,
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
                      enabled: widget.enableFields,
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
                      enabled: widget.enableFields,
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
                      enabled: widget.enableFields,
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
                      enabled: widget.enableFields,
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
                            enabled: widget.enableFields,
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
                            enabled: widget.enableFields,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
