import 'package:flutter/material.dart';
import 'package:onlabproject/view/LoginView.dart';
import 'package:onlabproject/view/RegisterView.dart';
import 'package:onlabproject/view/components/LoadingPage.dart';
import 'package:onlabproject/view_model/LoginViewModel.dart';
import 'package:onlabproject/view_model/RegisterViewModel.dart';

class AuthController extends StatefulWidget {
  @override
  _AuthControllerState createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController>  {
  RegisterViewModel _registerViewModel;
  LoginViewModel _loginViewModel;
  AuthState _authState = AuthState.LOADING;

  void _stateChanged() {
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
          stateChanged: _stateChanged,
          viewModel: _loginViewModel,
        );
      case AuthState.REGISTER:
        return RegisterView(
          stateChanged: _stateChanged,
          viewModel: _registerViewModel,
        );
      default:
        return LoadingPage();
    }
  }
}

enum AuthState { LOGIN, REGISTER, LOADING}
