import 'package:flutter/material.dart';

class ObjectItemModel {
  final String id;
  final String name;
  final int piece;
  String imageURL;

  ObjectItemModel({this.id, @required this.name, this.piece = 1, this.imageURL});

  ObjectItemModel.fromSnapshot(dynamic id, dynamic snapshotValue)
      : id = id,
        name = snapshotValue["name"],
        piece = int.parse(snapshotValue["piece"].toString()),
        imageURL = snapshotValue["image"];

  toJson() {
    return {
      "name": name,
      "piece": piece,
      "image": imageURL,
    };
  }
}