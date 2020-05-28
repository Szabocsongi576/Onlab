// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ObjectListViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ObjectListViewModel on _ObjectListViewModel, Store {
  final _$imageAtom = Atom(name: '_ObjectListViewModel.image');

  @override
  File get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$pieceAtom = Atom(name: '_ObjectListViewModel.piece');

  @override
  int get piece {
    _$pieceAtom.reportRead();
    return super.piece;
  }

  @override
  set piece(int value) {
    _$pieceAtom.reportWrite(value, super.piece, () {
      super.piece = value;
    });
  }

  final _$objectNameAtom = Atom(name: '_ObjectListViewModel.objectName');

  @override
  String get objectName {
    _$objectNameAtom.reportRead();
    return super.objectName;
  }

  @override
  set objectName(String value) {
    _$objectNameAtom.reportWrite(value, super.objectName, () {
      super.objectName = value;
    });
  }

  final _$objectNameErrorAtom =
      Atom(name: '_ObjectListViewModel.objectNameError');

  @override
  bool get objectNameError {
    _$objectNameErrorAtom.reportRead();
    return super.objectNameError;
  }

  @override
  set objectNameError(bool value) {
    _$objectNameErrorAtom.reportWrite(value, super.objectNameError, () {
      super.objectNameError = value;
    });
  }

  @override
  String toString() {
    return '''
image: ${image},
piece: ${piece},
objectName: ${objectName},
objectNameError: ${objectNameError}
    ''';
  }
}
