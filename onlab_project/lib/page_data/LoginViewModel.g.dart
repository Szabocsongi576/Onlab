// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Login_LoginViewModel on _LoginViewModel, Store {
  final _$rememberMeAtom = Atom(name: '_LoginData.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  @override
  String toString() {
    return '''
rememberMe: ${rememberMe}
    ''';
  }
}
