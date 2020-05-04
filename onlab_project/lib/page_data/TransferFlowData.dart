import 'package:flutter/material.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';

class TransferFlowData {
  List<ObjectItemModel> objectList = List();

  DateTime selectedDate = DateTime.now();
  String selectedDayPeriod;

  Map<String, FocusNode> focusNodeMap = {
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
  Map<String, TextEditingController> textEditingControllerMap = {
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

  Map<String, bool> errorMap = {
    "email": false,
    "firstName": false,
    "lastName": false,
    "postalCode": false,
    "city": false,
    "streetAndNum": false,
    "other": false,
    "countryCode": false,
    "tel": false,

    "selectedDayPeriod": false,
  };

  TransferFlowData();
}