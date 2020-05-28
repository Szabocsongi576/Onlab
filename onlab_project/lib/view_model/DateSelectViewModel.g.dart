// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DateSelectViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DateSelectViewModel on _DateSelectViewModel, Store {
  final _$selectedDateAtom = Atom(name: '_DateSelectViewModel.selectedDate');

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  final _$selectedIntervalAtom =
      Atom(name: '_DateSelectViewModel.selectedInterval');

  @override
  String get selectedInterval {
    _$selectedIntervalAtom.reportRead();
    return super.selectedInterval;
  }

  @override
  set selectedInterval(String value) {
    _$selectedIntervalAtom.reportWrite(value, super.selectedInterval, () {
      super.selectedInterval = value;
    });
  }

  final _$selectedIntervalErrorAtom =
      Atom(name: '_DateSelectViewModel.selectedIntervalError');

  @override
  bool get selectedIntervalError {
    _$selectedIntervalErrorAtom.reportRead();
    return super.selectedIntervalError;
  }

  @override
  set selectedIntervalError(bool value) {
    _$selectedIntervalErrorAtom.reportWrite(value, super.selectedIntervalError,
        () {
      super.selectedIntervalError = value;
    });
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate},
selectedInterval: ${selectedInterval},
selectedIntervalError: ${selectedIntervalError}
    ''';
  }
}
