// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransferFlowViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransferFlowViewModel on _TransferFlowViewModel, Store {
  final _$useProfileDataAtom =
      Atom(name: '_TransferFlowViewModel.useProfileData');

  @override
  bool get useProfileData {
    _$useProfileDataAtom.reportRead();
    return super.useProfileData;
  }

  @override
  set useProfileData(bool value) {
    _$useProfileDataAtom.reportWrite(value, super.useProfileData, () {
      super.useProfileData = value;
    });
  }

  @override
  String toString() {
    return '''
useProfileData: ${useProfileData}
    ''';
  }
}
