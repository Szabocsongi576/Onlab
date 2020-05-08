// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ObjectListData.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ObjectListData on _ObjectListData, Store {
  final _$imageAtom = Atom(name: '_ObjectListData.image');

  @override
  File get image {
    _$imageAtom.context.enforceReadPolicy(_$imageAtom);
    _$imageAtom.reportObserved();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.context.conditionallyRunInAction(() {
      super.image = value;
      _$imageAtom.reportChanged();
    }, _$imageAtom, name: '${_$imageAtom.name}_set');
  }

  final _$pieceAtom = Atom(name: '_ObjectListData.piece');

  @override
  int get piece {
    _$pieceAtom.context.enforceReadPolicy(_$pieceAtom);
    _$pieceAtom.reportObserved();
    return super.piece;
  }

  @override
  set piece(int value) {
    _$pieceAtom.context.conditionallyRunInAction(() {
      super.piece = value;
      _$pieceAtom.reportChanged();
    }, _$pieceAtom, name: '${_$pieceAtom.name}_set');
  }

  final _$objectNameAtom = Atom(name: '_ObjectListData.objectName');

  @override
  String get objectName {
    _$objectNameAtom.context.enforceReadPolicy(_$objectNameAtom);
    _$objectNameAtom.reportObserved();
    return super.objectName;
  }

  @override
  set objectName(String value) {
    _$objectNameAtom.context.conditionallyRunInAction(() {
      super.objectName = value;
      _$objectNameAtom.reportChanged();
    }, _$objectNameAtom, name: '${_$objectNameAtom.name}_set');
  }

  final _$objectNameErrorAtom = Atom(name: '_ObjectListData.objectNameError');

  @override
  bool get objectNameError {
    _$objectNameErrorAtom.context.enforceReadPolicy(_$objectNameErrorAtom);
    _$objectNameErrorAtom.reportObserved();
    return super.objectNameError;
  }

  @override
  set objectNameError(bool value) {
    _$objectNameErrorAtom.context.conditionallyRunInAction(() {
      super.objectNameError = value;
      _$objectNameErrorAtom.reportChanged();
    }, _$objectNameErrorAtom, name: '${_$objectNameErrorAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'image: ${image.toString()},piece: ${piece.toString()},objectName: ${objectName.toString()},objectNameError: ${objectNameError.toString()}';
    return '{$string}';
  }
}
