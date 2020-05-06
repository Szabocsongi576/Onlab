import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'LoginData.g.dart';

class LoginData = _LoginData with _$LoginData;

abstract class _LoginData with Store {

   @observable
   bool rememberMe = false;

   TextEditingController passwordController = TextEditingController();
   TextEditingController emailController = TextEditingController();

   FocusNode passwordFocus = FocusNode();
   FocusNode emailFocus = FocusNode();

   loseFocus() {
      emailFocus.unfocus();
      passwordFocus.unfocus();
   }
}