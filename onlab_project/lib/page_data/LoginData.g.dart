// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginData.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginData on _LoginData, Store {
  final _$rememberMeAtom = Atom(name: '_LoginData.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.context.enforceReadPolicy(_$rememberMeAtom);
    _$rememberMeAtom.reportObserved();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.context.conditionallyRunInAction(() {
      super.rememberMe = value;
      _$rememberMeAtom.reportChanged();
    }, _$rememberMeAtom, name: '${_$rememberMeAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'rememberMe: ${rememberMe.toString()}';
    return '{$string}';
  }
}
