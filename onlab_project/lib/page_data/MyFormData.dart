import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'MyFormData.g.dart';

class MyFormData = _MyFormData with _$MyFormData;

abstract class _MyFormData with Store{
  Map<String, bool> errorMap = {
    "password": false,
    "email": false,
    "firstName": false,
    "lastName": false,
    "postalCode": false,
    "city": false,
    "streetAndNum": false,
    "countryCode": false,
    "tel": false,
  };

  @observable
  String password;

  @observable
  String email;

  @observable
  String firstName;

  @observable
  String lastName;

  @observable
  String postalCode;

  @observable
  String city;

  @observable
  String streetAndNum;

  @observable
  String other;

  @observable
  String countryCode;

  @observable
  String tel;

  Map<String, FocusNode> focusNodeMap = {
    "password": FocusNode(),
    "email": FocusNode(),
    "firstName": FocusNode(),
    "lastName": FocusNode(),
    "postalCode": FocusNode(),
    "city": FocusNode(),
    "streetAndNum": FocusNode(),
    "other": FocusNode(),
    "countryCode": FocusNode(),
    "tel": FocusNode(),
  };
  Map<String, TextEditingController> textEditingControllerMap = {
    "password": TextEditingController(),
    "email": TextEditingController(),
    "firstName": TextEditingController(),
    "lastName": TextEditingController(),
    "postalCode": TextEditingController(),
    "city": TextEditingController(),
    "streetAndNum": TextEditingController(),
    "other": TextEditingController(),
    "countryCode": TextEditingController(),
    "tel": TextEditingController(),
  };

  @observable
  bool passwordError;

  @observable
  bool emailError;

  @observable
  bool firstNameError;

  @observable
  bool lastNameError;

  @observable
  bool postalCodeError;

  @observable
  bool cityError;

  @observable
  bool streetAndNumError;

  @observable
  bool countryCodeError;

  @observable
  bool telError;

  _MyFormData() {
    textEditingControllerMap["password"].addListener(() {
      (textEditingControllerMap["password"].text.length == 0)
        ? password = ""
        : password = textEditingControllerMap["password"].text;
    });
    textEditingControllerMap["email"].addListener(() {
      (textEditingControllerMap["email"].text.length == 0)
          ? email = ""
          : email = textEditingControllerMap["email"].text;
    });
    textEditingControllerMap["firstName"].addListener(() {
      (textEditingControllerMap["firstName"].text.length == 0)
          ? firstName = ""
          : firstName = textEditingControllerMap["firstName"].text;
    });
    textEditingControllerMap["lastName"].addListener(() {
      (textEditingControllerMap["lastName"].text.length == 0)
          ? lastName = ""
          : lastName = textEditingControllerMap["lastName"].text;
    });
    textEditingControllerMap["postalCode"].addListener(() {
      (textEditingControllerMap["postalCode"].text.length == 0)
          ? postalCode = ""
          : postalCode = textEditingControllerMap["postalCode"].text;
    });
    textEditingControllerMap["city"].addListener(() {
      (textEditingControllerMap["city"].text.length == 0)
          ? city = ""
          : city = textEditingControllerMap["city"].text;
    });
    textEditingControllerMap["streetAndNum"].addListener(() {
      (textEditingControllerMap["streetAndNum"].text.length == 0)
          ? streetAndNum = ""
          : streetAndNum = textEditingControllerMap["streetAndNum"].text;
    });
    textEditingControllerMap["other"].addListener(() {
      (textEditingControllerMap["other"].text.length == 0)
          ? other = ""
          : other = textEditingControllerMap["other"].text;
    });
    textEditingControllerMap["countryCode"].addListener(() {
      (textEditingControllerMap["countryCode"].text.length == 0)
          ? countryCode = ""
          : countryCode = textEditingControllerMap["countryCode"].text;
    });
    textEditingControllerMap["tel"].addListener(() {
      (textEditingControllerMap["tel"].text.length == 0)
          ? tel = ""
          : tel = textEditingControllerMap["tel"].text;
    });
  }
}