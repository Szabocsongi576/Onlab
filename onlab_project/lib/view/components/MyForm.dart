import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/page_data/MyFormData.dart';
import 'package:onlabproject/view/components/MyTextField.dart';

class MyForm extends StatelessWidget {
  final MyFormData data;
  final bool emailActive;
  final bool passwordActive;
  final bool enableFields;

  const MyForm({
    Key key,
    @required this.data,
    this.emailActive = false,
    this.passwordActive = false,
    this.enableFields = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          data.focusNodeMap.forEach((key, value) =>  value.unfocus());
        },
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: ScreenUtil().setWidth(600),
              child: Column(
                children: <Widget>[
                  emailActive
                      ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: data.textEditingControllerMap["email"],
                        focusNode: data.focusNodeMap["email"],
                        enabled: enableFields,
                        isError: data.emailError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT_EMAIL,
                        labelText: StringResource.REGISTER_EMAIL_LABEL,
                      ),
                    ),
                  )
                      : Container(),
                  passwordActive
                    ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: data.textEditingControllerMap["password"],
                        focusNode: data.focusNodeMap["password"],
                        enabled: enableFields,
                        isError: data.passwordError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT_PASS,
                        labelText: StringResource.REGISTER_PASSWORD_LABEL,
                      ),
                    ),
                  )
                    : Container(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: data.textEditingControllerMap["firstName"],
                        focusNode: data.focusNodeMap["firstName"],
                        enabled: enableFields,
                        isError: data.firstNameError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_FIRST_NAME_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: data.textEditingControllerMap["lastName"],
                        focusNode: data.focusNodeMap["lastName"],
                        enabled: enableFields,
                        isError: data.lastNameError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_LAST_NAME_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: data.textEditingControllerMap["postalCode"],
                        focusNode: data.focusNodeMap["postalCode"],
                        enabled: enableFields,
                        isError: data.postalCodeError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_POSTAL_CODE_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: data.textEditingControllerMap["city"],
                        focusNode: data.focusNodeMap["city"],
                        enabled: enableFields,
                        isError: data.cityError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_CITY_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: data.textEditingControllerMap["streetAndNum"],
                        focusNode: data.focusNodeMap["streetAndNum"],
                        enabled: enableFields,
                        isError: data.streetAndNumError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_STREET_AND_NUM_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: data.textEditingControllerMap["other"],
                        focusNode: data.focusNodeMap["other"],
                        enabled: enableFields,
                        labelText: StringResource.REGISTER_OTHER_LABEL,
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
                          child: Observer(
                              builder: (_) => MyTextField(
                                controller: data.textEditingControllerMap["countryCode"],
                                focusNode: data.focusNodeMap["countryCode"],
                                enabled: enableFields,
                                isError: data.countryCodeError,
                                errorText: StringResource.FORM_FIELD_ERROR_TEXT_COUNTRY_CODE,
                                labelText: StringResource.REGISTER_COUNTRY_CODE_LABEL,
                              ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(390),
                          child: Observer(
                            builder: (_) => MyTextField(
                              controller: data.textEditingControllerMap["tel"],
                              focusNode: data.focusNodeMap["tel"],
                              enabled: enableFields,
                              isError: data.telError,
                              errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                              labelText: StringResource.REGISTER_TEL_LABEL,
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
