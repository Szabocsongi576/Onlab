// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransferData.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransferData on _TransferData, Store {
  final _$stateAtom = Atom(name: '_TransferData.state');

  @override
  TransferState get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(TransferState value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'state: ${state.toString()}';
    return '{$string}';
  }
}
