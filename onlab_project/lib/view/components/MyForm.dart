import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/page_data/MyFormViewModel.dart';
import 'package:onlabproject/view/components/MyTextField.dart';

class MyForm extends StatelessWidget {
  final MyFormViewModel viewModel;
  final bool emailActive;
  final bool passwordActive;
  final bool enableFields;

  const MyForm({
    Key key,
    @required this.viewModel,
    this.emailActive = false,
    this.passwordActive = false,
    this.enableFields = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          viewModel.focusNodeMap.forEach((key, value) =>  value.unfocus());
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
                        controller: viewModel.textEditingControllerMap["email"],
                        focusNode: viewModel.focusNodeMap["email"],
                        enabled: enableFields,
                        isError: viewModel.emailError,
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
                        controller: viewModel.textEditingControllerMap["password"],
                        focusNode: viewModel.focusNodeMap["password"],
                        enabled: enableFields,
                        isError: viewModel.passwordError,
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
                        controller: viewModel.textEditingControllerMap["firstName"],
                        focusNode: viewModel.focusNodeMap["firstName"],
                        enabled: enableFields,
                        isError: viewModel.firstNameError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_FIRST_NAME_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: viewModel.textEditingControllerMap["lastName"],
                        focusNode: viewModel.focusNodeMap["lastName"],
                        enabled: enableFields,
                        isError: viewModel.lastNameError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_LAST_NAME_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: viewModel.textEditingControllerMap["postalCode"],
                        focusNode: viewModel.focusNodeMap["postalCode"],
                        enabled: enableFields,
                        isError: viewModel.postalCodeError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_POSTAL_CODE_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: viewModel.textEditingControllerMap["city"],
                        focusNode: viewModel.focusNodeMap["city"],
                        enabled: enableFields,
                        isError: viewModel.cityError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_CITY_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: viewModel.textEditingControllerMap["streetAndNum"],
                        focusNode: viewModel.focusNodeMap["streetAndNum"],
                        enabled: enableFields,
                        isError: viewModel.streetAndNumError,
                        errorText: StringResource.FORM_FIELD_ERROR_TEXT,
                        labelText: StringResource.REGISTER_STREET_AND_NUM_LABEL,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(30)),
                    child: Observer(
                      builder: (_) => MyTextField(
                        controller: viewModel.textEditingControllerMap["other"],
                        focusNode: viewModel.focusNodeMap["other"],
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
                                controller: viewModel.textEditingControllerMap["countryCode"],
                                focusNode: viewModel.focusNodeMap["countryCode"],
                                enabled: enableFields,
                                isError: viewModel.countryCodeError,
                                errorText: StringResource.FORM_FIELD_ERROR_TEXT_COUNTRY_CODE,
                                labelText: StringResource.REGISTER_COUNTRY_CODE_LABEL,
                              ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(390),
                          child: Observer(
                            builder: (_) => MyTextField(
                              controller: viewModel.textEditingControllerMap["tel"],
                              focusNode: viewModel.focusNodeMap["tel"],
                              enabled: enableFields,
                              isError: viewModel.telError,
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
