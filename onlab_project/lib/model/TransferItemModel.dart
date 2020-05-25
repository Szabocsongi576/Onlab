import 'package:flutter/cupertino.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';
import 'package:onlabproject/service/TransferListItemConvertService.dart';

class TransferItemModel {
  String id;

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
    this.id,
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

  TransferItemModel.fromSnapshot(dynamic id, dynamic snapshotValue)
      : id = id,
        state = TransferListItemConvertService.getStateByStateId(snapshotValue["state"]),
        description = snapshotValue["description"] ?? snapshotValue["description"],
        price = snapshotValue["price"] ?? snapshotValue["price"],
        address = snapshotValue["address"],
        name = snapshotValue["name"],
        tel = snapshotValue["tel"],
        objectList = _getObjectListFromSnapshot(snapshotValue["objectList"]),
        date = DateTime.fromMillisecondsSinceEpoch(snapshotValue["date"]),
        timeInterval = snapshotValue["timeInterval"];

  static List<ObjectItemModel> _getObjectListFromSnapshot(Map<dynamic, dynamic> snapshotValue) {
    List<ObjectItemModel> list = List<ObjectItemModel>();

    if(snapshotValue != null) {
      snapshotValue.forEach((key, values) {
        list.add(ObjectItemModel.fromSnapshot(key, values));
      });
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
