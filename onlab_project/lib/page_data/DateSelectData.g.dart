// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DateSelectData.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DateSelectData on _DateSelectData, Store {
  final _$selectedDateAtom = Atom(name: '_DateSelectData.selectedDate');

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.context.enforceReadPolicy(_$selectedDateAtom);
    _$selectedDateAtom.reportObserved();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.context.conditionallyRunInAction(() {
      super.selectedDate = value;
      _$selectedDateAtom.reportChanged();
    }, _$selectedDateAtom, name: '${_$selectedDateAtom.name}_set');
  }

  final _$selectedIntervalAtom = Atom(name: '_DateSelectData.selectedInterval');

  @override
  String get selectedInterval {
    _$selectedIntervalAtom.context.enforceReadPolicy(_$selectedIntervalAtom);
    _$selectedIntervalAtom.reportObserved();
    return super.selectedInterval;
  }

  @override
  set selectedInterval(String value) {
    _$selectedIntervalAtom.context.conditionallyRunInAction(() {
      super.selectedInterval = value;
      _$selectedIntervalAtom.reportChanged();
    }, _$selectedIntervalAtom, name: '${_$selectedIntervalAtom.name}_set');
  }

  final _$selectedIntervalErrorAtom =
      Atom(name: '_DateSelectData.selectedIntervalError');

  @override
  bool get selectedIntervalError {
    _$selectedIntervalErrorAtom.context
        .enforceReadPolicy(_$selectedIntervalErrorAtom);
    _$selectedIntervalErrorAtom.reportObserved();
    return super.selectedIntervalError;
  }

  @override
  set selectedIntervalError(bool value) {
    _$selectedIntervalErrorAtom.context.conditionallyRunInAction(() {
      super.selectedIntervalError = value;
      _$selectedIntervalErrorAtom.reportChanged();
    }, _$selectedIntervalErrorAtom,
        name: '${_$selectedIntervalErrorAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'selectedDate: ${selectedDate.toString()},selectedInterval: ${selectedInterval.toString()},selectedIntervalError: ${selectedIntervalError.toString()}';
    return '{$string}';
  }
}
