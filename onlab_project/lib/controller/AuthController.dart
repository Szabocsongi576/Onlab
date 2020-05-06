import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:onlabproject/page_data/LoginData.dart';
import 'package:onlabproject/page_data/MyFormData.dart';
import 'package:onlabproject/view/LoginView.dart';
import 'package:onlabproject/view/RegisterView.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/firebase/MyFirebaseAuthManager.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/view/TabView.dart';
import 'package:onlabproject/view/components/MyBackground.dart';

class AuthController extends StatefulWidget {
  @override
  _AuthControllerState createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> implements IAuthController {
  MyFormData _registerData;
  LoginData _loginData;
  AuthState _authState = AuthState.LOADING;

  final _storage = FlutterSecureStorage();

  void _deleteStorageData() {
    _storage.delete(key: StringResource.STORAGE_E_KEY);
    _storage.delete(key: StringResource.STORAGE_PW_KEY);
  }

  Future<void> _addItemToStorage(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> _loadFromStorage() async {
    String e = await _storage.read(key: StringResource.STORAGE_E_KEY);
    String pw = await _storage.read(key: StringResource.STORAGE_PW_KEY);
    if (e != null && pw != null) {
      _loginData.emailController.text = e;
      _loginData.passwordController.text = pw;
      _loginData.rememberMe = true;
    }

    setState(() {
      _authState = AuthState.LOGIN;
    }); //TODO MOBX
  }

  @override
  void initState() {
    super.initState();

    _registerData = MyFormData();
    _loginData = LoginData();

    _loadFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    switch(_authState) {
      case AuthState.LOGIN:
        return LoginView(
          authController: this,
          data: _loginData,
        );
      case AuthState.REGISTER:
        return RegisterView(
          authController: this,
          data: _registerData,
        );
      default:
        return MyBackground(
          child: Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        );
    }
  }

  @override
  void stateChanged() {
    setState(() {
      if (_authState == AuthState.LOGIN) {

        _authState = AuthState.REGISTER;
      } else {
        _authState = AuthState.LOGIN;
      }
    });
  }

  @override
  void login() {
    print("LOGIN");

    setState(() {
      _authState = AuthState.LOADING;
    });

    String email = _loginData.emailController.text;
    String password = _loginData.passwordController.text;

    MyFirebaseAuthManager
        .signInWithEmailAndPassword(email, password)
        .then((succeed) {
      if (succeed) {
        print("LOGIN");

        _deleteStorageData();
        if (_loginData.rememberMe) {
          _addItemToStorage(StringResource.STORAGE_E_KEY, email);
          _addItemToStorage(StringResource.STORAGE_PW_KEY, password);
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TabView()),
        );
      } else {
        //TODO Login falied
      }
    }).catchError((error) => print(error));
  }

  @override
  void register() {
    print("REGISTER");
    setState(() {
      _authState = AuthState.LOADING;
    });

    String email =  _registerData.textEditingControllerMap["email"].text;
    String password =  _registerData.textEditingControllerMap["password"].text;

    ProfileModel data = ProfileModel(
      email:  _registerData.textEditingControllerMap["email"].text,
      firstName:  _registerData.textEditingControllerMap["firstName"].text,
      lastName:  _registerData.textEditingControllerMap["lastName"].text,
      postalCode:  _registerData.textEditingControllerMap["postalCode"].text,
      city:  _registerData.textEditingControllerMap["city"].text,
      streetAndNum:  _registerData.textEditingControllerMap["streetAndNum"].text,
      other: _registerData.textEditingControllerMap["other"].text,
      countryCode:  _registerData.textEditingControllerMap["countryCode"].text,
      tel:  _registerData.textEditingControllerMap["tel"].text,
    );

    MyFirebaseAuthManager
        .register(email, password, data)
        .then((succeed) {
      if (succeed) {
        print("REGISTER");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TabView()),
        );
      } else {
        //TODO Register falied
      }
    }).catchError((error) => print(error));
  }
}

abstract class IAuthController {
  void stateChanged();

  void register();

  void login();
}

enum AuthState { LOGIN, REGISTER, LOADING}
