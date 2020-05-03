import 'package:flutter/material.dart';
import 'package:onlabproject/model/RegisterModel.dart';

class AuthData {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool rememberMe = false;

  RegisterModel registerModel = RegisterModel();

  AuthData() {}
}