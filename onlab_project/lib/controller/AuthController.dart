import 'package:flutter/material.dart';
import 'package:onlabproject/page_data/LoginViewModel.dart';
import 'package:onlabproject/page_data/MyFormViewModel.dart';
import 'package:onlabproject/page_data/RegisterViewModel.dart';
import 'package:onlabproject/view/LoginView.dart';
import 'package:onlabproject/view/RegisterView.dart';
import 'package:onlabproject/view/components/LoadingPage.dart';

class AuthController extends StatefulWidget {
  @override
  _AuthControllerState createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController>  {
  RegisterViewModel _registerViewModel;
  LoginViewModel _loginViewModel;
  AuthState _authState = AuthState.LOADING;

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
  void initState() {
    super.initState();

    _registerViewModel = RegisterViewModel();
    _loginViewModel = LoginViewModel();

    _loginViewModel.loadFromStorage().then((_) {
      setState(() {
        _authState = AuthState.LOGIN;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(_authState) {
      case AuthState.LOGIN:
        return LoginView(
          stateChanged: stateChanged,
          viewModel: _loginViewModel,
        );
      case AuthState.REGISTER:
        return RegisterView(
          stateChanged: stateChanged,
          viewModel: _registerViewModel,
        );
      default:
        return LoadingPage();
    }
  }
}

enum AuthState { LOGIN, REGISTER, LOADING}
