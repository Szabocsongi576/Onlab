import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:onlabproject/model/ProfileModel.dart';

part 'MyFormViewModel.g.dart';

class MyFormViewModel = _MyFormViewModel with _$MyFormViewModel;

abstract class _MyFormViewModel with Store{
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
  bool passwordError = false;

  @observable
  bool emailError = false;

  @observable
  bool firstNameError = false;

  @observable
  bool lastNameError = false;

  @observable
  bool postalCodeError = false;

  @observable
  bool cityError = false;

  @observable
  bool streetAndNumError = false;

  @observable
  bool countryCodeError = false;

  @observable
  bool telError = false;

  void reset() {
    textEditingControllerMap.forEach((k, v) => v.clear());

    passwordError = false;
    emailError = false;
    firstNameError = false;
    lastNameError = false;
    postalCodeError = false;
    cityError = false;
    streetAndNumError = false;
    countryCodeError = false;
    telError = false;
  }

  void _registerListeners() {
    textEditingControllerMap["password"].addListener(() {
      passwordError = false;
      (textEditingControllerMap["password"].text.isEmpty)
        ? password = ""
        : password = textEditingControllerMap["password"].text;
    });
    textEditingControllerMap["email"].addListener(() {
      emailError = false;
      (textEditingControllerMap["email"].text.isEmpty)
          ? email = ""
          : email = textEditingControllerMap["email"].text;
    });
    textEditingControllerMap["firstName"].addListener(() {
      firstNameError = false;
      (textEditingControllerMap["firstName"].text.isEmpty)
          ? firstName = ""
          : firstName = textEditingControllerMap["firstName"].text;
    });
    textEditingControllerMap["lastName"].addListener(() {
      lastNameError = false;
      (textEditingControllerMap["lastName"].text.isEmpty)
          ? lastName = ""
          : lastName = textEditingControllerMap["lastName"].text;
    });
    textEditingControllerMap["postalCode"].addListener(() {
      postalCodeError = false;
      (textEditingControllerMap["postalCode"].text.isEmpty)
          ? postalCode = ""
          : postalCode = textEditingControllerMap["postalCode"].text;
    });
    textEditingControllerMap["city"].addListener(() {
      cityError = false;
      (textEditingControllerMap["city"].text.isEmpty)
          ? city = ""
          : city = textEditingControllerMap["city"].text;
    });
    textEditingControllerMap["streetAndNum"].addListener(() {
      streetAndNumError = false;
      (textEditingControllerMap["streetAndNum"].text.isEmpty)
          ? streetAndNum = ""
          : streetAndNum = textEditingControllerMap["streetAndNum"].text;
    });
    textEditingControllerMap["other"].addListener(() {
      (textEditingControllerMap["other"].text.isEmpty)
          ? other = ""
          : other = textEditingControllerMap["other"].text;
    });
    textEditingControllerMap["countryCode"].addListener(() {
      countryCodeError = false;
      (textEditingControllerMap["countryCode"].text.isEmpty)
          ? countryCode = ""
          : countryCode = textEditingControllerMap["countryCode"].text;
    });
    textEditingControllerMap["tel"].addListener(() {
      telError = false;
      (textEditingControllerMap["tel"].text.isEmpty)
          ? tel = ""
          : tel = textEditingControllerMap["tel"].text;
    });
  }

  bool isError() {
    return emailError || passwordError || firstNameError || lastNameError
        || postalCodeError || cityError || streetAndNumError
        || countryCodeError || telError;
  }

  bool validate() {
    if(email == null || email.length < 5 || !(email.contains("@") && email.contains("."))) {
      emailError = true;
    }
    if(password == null || password.length < 6) {
      passwordError = true;
    }
    if(firstName == null || firstName.length == 0) {
      firstNameError = true;
    }
    if(lastName == null || lastName.length == 0) {
      lastNameError = true;
    }
    if(postalCode == null || postalCode.length == 0) {
      postalCodeError = true;
    }
    if(city == null || city.length == 0) {
      cityError = true;
    }
    if(streetAndNum == null || streetAndNum.length == 0) {
      streetAndNumError = true;
    }
    if(countryCode == null || countryCode.length == 0) {
      countryCodeError = true;
    }
    if(tel == null || tel.length < 6) {
      telError = true;
    }

    return !isError();
  }

  void loseFocus() {
    focusNodeMap.forEach((key, value) =>  value.unfocus());
  }

  ProfileModel getProfileModel() {
    return ProfileModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      postalCode: postalCode,
      city: city,
      streetAndNum: streetAndNum,
      other: other,
      countryCode: countryCode,
      tel: tel,
    );
  }

  _MyFormViewModel() {
    _registerListeners();
  }
}