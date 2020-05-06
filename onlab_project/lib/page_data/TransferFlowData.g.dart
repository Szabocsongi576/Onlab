// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransferFlowData.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransferFlowData on _TransferFlowData, Store {
  final _$useProfileDataAtom = Atom(name: '_TransferFlowData.useProfileData');

  @override
  bool get useProfileData {
    _$useProfileDataAtom.context.enforceReadPolicy(_$useProfileDataAtom);
    _$useProfileDataAtom.reportObserved();
    return super.useProfileData;
  }

  @override
  set useProfileData(bool value) {
    _$useProfileDataAtom.context.conditionallyRunInAction(() {
      super.useProfileData = value;
      _$useProfileDataAtom.reportChanged();
    }, _$useProfileDataAtom, name: '${_$useProfileDataAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'useProfileData: ${useProfileData.toString()}';
    return '{$string}';
  }
}
