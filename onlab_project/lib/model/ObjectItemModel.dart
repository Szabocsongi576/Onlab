import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class ObjectItemModel {
  final String name;
  final int piece;
  final File image;

  ObjectItemModel({@required this.name, this.piece = 1, this.image});

  ObjectItemModel.fromSnapshot(dynamic snapshotValue)
      : name = snapshotValue["name"],
        piece = int.parse(snapshotValue["piece"].toString()),
        image = File.fromRawPath(base64Decode(snapshotValue["image"]));

  toJson() {
    return {
      "name": name,
      "piece": piece,
      "image": (image != null) ? base64Encode(image.readAsBytesSync()) : null,
    };
  }
}