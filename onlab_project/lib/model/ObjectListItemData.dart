import 'package:flutter/material.dart';

class ObjectListItemData {
  String _name;
  int _piece;

  ObjectListItemData({@required name, piece = 1}) {
    this._name = name;
    this._piece = piece;
  }

  String get name => _name;
  int get piece => _piece;

  set piece(int value) {
    _piece = value;
  }
}