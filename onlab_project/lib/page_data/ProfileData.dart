
import 'package:flutter/material.dart';
import 'package:onlabproject/model/ProfileModel.dart';

class ProfileData {
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
  };

  ProfileModel _model;

  ProfileModel get model => _model;
  set model(ProfileModel value) {
    _model = value;

    textEditingControllerMap["email"].text = value.email;
    textEditingControllerMap["firstName"].text = value.firstName;
    textEditingControllerMap["lastName"].text = value.lastName;
    textEditingControllerMap["postalCode"].text = value.postalCode;
    textEditingControllerMap["city"].text = value.city;
    textEditingControllerMap["streetAndNum"].text = value.streetAndNum;
    textEditingControllerMap["other"].text = value.other;
    textEditingControllerMap["countryCode"].text = value.countryCode;
    textEditingControllerMap["tel"].text = value.tel;
  }

  Map<String, bool> errorMap = {
    "firstName": false,
    "lastName": false,
    "postalCode": false,
    "city": false,
    "streetAndNum": false,
    "countryCode": false,
    "tel": false,
  };

  ProfileData();
}