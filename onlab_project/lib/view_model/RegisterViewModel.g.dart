// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModel, Store {
  final _$loadingAtom = Atom(name: '_RegisterViewModel.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
