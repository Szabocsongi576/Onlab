import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:onlabproject/view/LoginView.dart';
import 'package:onlabproject/view/RegisterView.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/firebase/MyFirebaseAuthManager.dart';
import 'package:onlabproject/page_data/AuthData.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/view/TabView.dart';
import 'package:onlabproject/view/components/MyBackground.dart';

class AuthController extends StatefulWidget {
  @override
  _AuthControllerState createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> implements IAuthController {
  AuthData _authData;
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
      _authData.textEditingControllerMap["login_email"].text = e;
      _authData.textEditingControllerMap["login_password"].text = pw;
      _authData.rememberMe = true;
    }

    setState(() {
      _authState = AuthState.LOGIN;
    }); //TODO MOBX
  }

  @override
  void initState() {
    super.initState();

    _authData = AuthData();

    _loadFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    switch(_authState) {
      case AuthState.LOGIN:
        return LoginView(
          authController: this,
          data: _authData,
        );
      case AuthState.REGISTER:
        return RegisterView(
          authController: this,
          data: _authData,
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

    String email = _authData.textEditingControllerMap["login_email"].text;
    String password = _authData.textEditingControllerMap["login_password"].text;

    MyFirebaseAuthManager
        .signInWithEmailAndPassword(email, password)
        .then((succeed) {
      if (succeed) {
        print("LOGIN");

        _deleteStorageData();
        if (_authData.rememberMe) {
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

    String email =  _authData.textEditingControllerMap["email"].text;
    String password =  _authData.textEditingControllerMap["password"].text;

    ProfileModel data = ProfileModel(
      email:  _authData.textEditingControllerMap["email"].text,
      firstName:  _authData.textEditingControllerMap["firstName"].text,
      lastName:  _authData.textEditingControllerMap["lastName"].text,
      postalCode:  _authData.textEditingControllerMap["postalCode"].text,
      city:  _authData.textEditingControllerMap["city"].text,
      streetAndNum:  _authData.textEditingControllerMap["streetAndNum"].text,
      other: _authData.textEditingControllerMap["other"].text,
      countryCode:  _authData.textEditingControllerMap["countryCode"].text,
      tel:  _authData.textEditingControllerMap["tel"].text,
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
