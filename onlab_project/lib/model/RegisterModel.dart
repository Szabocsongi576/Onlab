import 'package:flutter/material.dart';

class RegisterModel {
  String _username, _password, _email, _firstName, _lastName, _postalCode, _city, _streetAndNum, _other, _countryCode, _tel;

  String get username => _username;
  String get password => _password;
  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get city => _city;
  String get streetAndNum => _streetAndNum;
  String get other => _other;
  String get countryCode => _countryCode;
  String get tel => _tel;
  String get postalCode => _postalCode;

  Map<String, FocusNode> _focusNodeMap = {
    "username": FocusNode(),
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
  Map<String, FocusNode> get focusNodeMap => _focusNodeMap;

  Map<String, TextEditingController> _textEditingControllerMap = {
    "username": TextEditingController(),
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
  Map<String, TextEditingController> get textEditingControllerMap =>
      _textEditingControllerMap;

  RegisterModel() {
    _textEditingControllerMap["username"].addListener(() {
      if (_textEditingControllerMap["username"].text.isEmpty) {
        _username = "";
      } else {
        _username = _textEditingControllerMap["username"].text;
      }
    });
    _textEditingControllerMap["password"].addListener(() {
      if (_textEditingControllerMap["password"].text.isEmpty) {
        _password = "";
      } else {
        _password = _textEditingControllerMap["password"].text;
      }
    });
    _textEditingControllerMap["email"].addListener(() {
      if (_textEditingControllerMap["email"].text.isEmpty) {
        _email = "";
      } else {
        _email = _textEditingControllerMap["email"].text;
      }
    });
    _textEditingControllerMap["firstName"].addListener(() {
      if (_textEditingControllerMap["firstName"].text.isEmpty) {
        _firstName = "";
      } else {
        _firstName = _textEditingControllerMap["firstName"].text;
      }
    });
    _textEditingControllerMap["lastName"].addListener(() {
      if (_textEditingControllerMap["lastName"].text.isEmpty) {
        _lastName = "";
      } else {
        _lastName = _textEditingControllerMap["lastName"].text;
      }
    });
    _textEditingControllerMap["postalCode"].addListener(() {
      if (_textEditingControllerMap["postalCode"].text.isEmpty) {
        _postalCode = "";
      } else {
        _postalCode = _textEditingControllerMap["postalCode"].text;
      }
    });
    _textEditingControllerMap["city"].addListener(() {
      if (_textEditingControllerMap["city"].text.isEmpty) {
        _city = "";
      } else {
        _city = _textEditingControllerMap["city"].text;
      }
    });
    _textEditingControllerMap["streetAndNum"].addListener(() {
      if (_textEditingControllerMap["streetAndNum"].text.isEmpty) {
        _streetAndNum = "";
      } else {
        _streetAndNum = _textEditingControllerMap["streetAndNum"].text;
      }
    });
    _textEditingControllerMap["other"].addListener(() {
      if (_textEditingControllerMap["other"].text.isEmpty) {
        _other = "";
      } else {
        _other = _textEditingControllerMap["other"].text;
      }
    });
    _textEditingControllerMap["countryCode"].addListener(() {
      if (_textEditingControllerMap["countryCode"].text.isEmpty) {
        _countryCode = "";
      } else {
        _countryCode = _textEditingControllerMap["countryCode"].text;
      }
    });
    _textEditingControllerMap["tel"].addListener(() {
      if (_textEditingControllerMap["tel"].text.isEmpty) {
        _tel = "";
      } else {
        _tel = _textEditingControllerMap["tel"].text;
      }
    });
  }
}