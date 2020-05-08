import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';

class TransferItemModel {
  String key;

  final TransferListItemState state;
  final String description;
  final int price;

  final String address;
  final String name;
  final String tel;

  final List<ObjectItemModel> objectList;

  final DateTime date;
  final String timeInterval;

  TransferItemModel({
    this.state = TransferListItemState.OFFER_CLAIM_SENT,
    this.description,
    this.price,
    @required this.address,
    @required this.name,
    @required this.tel,
    @required this.objectList,
    @required this.date,
    @required this.timeInterval,
  });

  TransferItemModel.fromSnapshot(dynamic snapshotValue)
      : state = _getStateById(snapshotValue["state"]),
        description = snapshotValue["description"] ?? snapshotValue["description"],
        price = snapshotValue["price"] ?? snapshotValue["price"],
        address = snapshotValue["address"],
        name = snapshotValue["name"],
        tel = snapshotValue["tel"],
        objectList = _getObjectListFromSnapshot(snapshotValue["objectList"]), //TODO
        date = DateTime.fromMillisecondsSinceEpoch(snapshotValue["date"]),
        timeInterval = snapshotValue["timeInterval"];

  static TransferListItemState _getStateById(int snapshotId) {
    switch (snapshotId) {
      case 0:
        return TransferListItemState.OFFER_CLAIM_SENT;
      case 1:
        return TransferListItemState.OFFER_RECEIVED;
      case 2:
        return TransferListItemState.UNDER_TRANSFER;
      default:
        return TransferListItemState.DONE;
    }
  }

  static List<ObjectItemModel> _getObjectListFromSnapshot(dynamic snapshot) {
    List<ObjectItemModel> list = List<ObjectItemModel>();
    for(var item in snapshot) {
      list.add(ObjectItemModel.fromSnapshot(item));
    }

    return list;
  }

  toJson() {
    int stateId;

    switch (this.state) {
      case TransferListItemState.OFFER_CLAIM_SENT:
        stateId = 0;
        break;
      case TransferListItemState.OFFER_RECEIVED:
        stateId = 1;
        break;
      case TransferListItemState.UNDER_TRANSFER:
        stateId = 2;
        break;
      default:
        stateId = 3;
        break;
    }

    var objectListJson = List();
    for(ObjectItemModel item in objectList) {
      objectListJson.add(item.toJson());
    }

    return {
      "state": stateId,
      "description": description,
      "price": price,
      "address": address,
      "name": name,
      "tel": tel,
      "objectList": objectListJson,
      "date": date.millisecondsSinceEpoch,
      "timeInterval": timeInterval,
    };
  }
}

enum TransferListItemState {
  OFFER_CLAIM_SENT,
  OFFER_RECEIVED,
  UNDER_TRANSFER,
  DONE
}
