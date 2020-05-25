import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';

import '../Resource/StringResource.dart';

part 'LoginViewModel.g.dart';

class LoginViewModel = _LoginViewModel with _$Login_LoginViewModel;

abstract class _LoginViewModel with Store {
   final _storage = FlutterSecureStorage();

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

   void handleStorageData() {
      _storage.delete(key: StringResource.STORAGE_E_KEY);
      _storage.delete(key: StringResource.STORAGE_PW_KEY);

      if (rememberMe) {
         addItemToStorage(StringResource.STORAGE_E_KEY, emailController.text);
         addItemToStorage(StringResource.STORAGE_PW_KEY, passwordController.text);
      }
   }

   Future<void> addItemToStorage(String key, String value) async {
      await _storage.write(key: key, value: value);
   }

   Future<void> loadFromStorage() async {
      String e = await _storage.read(key: StringResource.STORAGE_E_KEY);
      String pw = await _storage.read(key: StringResource.STORAGE_PW_KEY);
      if (e != null && pw != null) {
         emailController.text = e;
         passwordController.text = pw;
         rememberMe = true;
      }
   }

   Future<AuthResponse> login() async {
      String email = emailController.text;
      String password = passwordController.text;

      AuthResponse response =
      await MyFirebaseAuthService.signInWithEmailAndPassword(email, password);

      if (response == AuthResponse.LoggedIn) {
         handleStorageData();
      }
      return response;
   }
}