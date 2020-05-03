import 'package:flutter/material.dart';
import 'package:onlabproject/model/ObjectListItemData.dart';

class TransferFlowData {
  String _email, _firstName, _lastName, _postalCode, _city, _streetAndNum, _other, _countryCode, _tel;
  List<ObjectListItemData> _objectList = List();

  DateTime _selectedDate = DateTime.now();
  String _selectedDayPeriod;

  Map<String, FocusNode> _focusNodeMap = {
    "email": FocusNode(),
    "firstName": FocusNode(),
    "lastName": FocusNode(),
    "postalCode": FocusNode(),
    "city": FocusNode(),
    "streetAndNum": FocusNode(),
    "other": FocusNode(),
    "countryCode": FocusNode(),
    "tel": FocusNode(),

    "objectName": FocusNode(),
    "pieceOfObject": FocusNode(),
  };
  Map<String, TextEditingController> _textEditingControllerMap = {
    "email": TextEditingController(),
    "firstName": TextEditingController(),
    "lastName": TextEditingController(),
    "postalCode": TextEditingController(),
    "city": TextEditingController(),
    "streetAndNum": TextEditingController(),
    "other": TextEditingController(),
    "countryCode": TextEditingController(),
    "tel": TextEditingController(),

    "objectName": TextEditingController(),
    "pieceOfObject": TextEditingController(),
  };

  TransferFlowData() {
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

  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get city => _city;
  String get streetAndNum => _streetAndNum;
  String get other => _other;
  String get countryCode => _countryCode;
  String get tel => _tel;
  String get postalCode => _postalCode;

  List<ObjectListItemData> get objectList => _objectList;

  DateTime get selectedDate => _selectedDate;
  String get selectedDayPeriod => _selectedDayPeriod;

  Map<String, FocusNode> get focusNodeMap => _focusNodeMap;
  Map<String, TextEditingController> get textEditingControllerMap => _textEditingControllerMap;

  set selectedDate(DateTime value) {
    _selectedDate = value;
  }
  set selectedDayPeriod(String value) {
    _selectedDayPeriod = value;
  }
}