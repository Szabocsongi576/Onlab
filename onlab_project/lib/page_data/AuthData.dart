import 'package:flutter/material.dart';

class AuthData {
  bool rememberMe = false;

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

    "login_email": FocusNode(),
    "login_password": FocusNode(),
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

    "login_email": TextEditingController(),
    "login_password": TextEditingController(),
  };

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

  AuthData();
}