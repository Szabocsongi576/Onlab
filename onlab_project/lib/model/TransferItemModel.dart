import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class TransferItemModel {
  String key;
  String address;
  DateTime date;
  TransferListItemState state;
  String description;
  int price;

  TransferItemModel({
    @required this.address,
    @required this.date,
    this.state = TransferListItemState.OFFER_CLAIM_SENT,
    this.description,
    this.price,
  });

  TransferItemModel.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        address = snapshot.value["address"],
        date = snapshot.value["date"],
        description = snapshot.value["description"],
        price = snapshot.value["price"] {
    switch(snapshot.value["state"]) {
      case 0:
        state = TransferListItemState.OFFER_CLAIM_SENT;
        break;
      case 1:
        state = TransferListItemState.OFFER_RECEIVED;
        break;
      case 2:
        state = TransferListItemState.UNDER_TRANSFER;
        break;
      default:
        state = TransferListItemState.DONE;
        break;
    }
  }

  toJson() {
    int jsonState;

    switch(this.state) {
      case TransferListItemState.OFFER_CLAIM_SENT:
        jsonState = 0;
        break;
      case TransferListItemState.OFFER_RECEIVED:
        jsonState = 1;
        break;
      case TransferListItemState.UNDER_TRANSFER:
        jsonState = 2;
        break;
      default:
        jsonState = 3;
        break;
    }

    return {
      "address": address,
      "date": date,
      "state": jsonState,
      "description": description,
      "price": price,
    };
  }
}

enum TransferListItemState {
  OFFER_CLAIM_SENT,
  OFFER_RECEIVED,
  UNDER_TRANSFER,
  DONE
}