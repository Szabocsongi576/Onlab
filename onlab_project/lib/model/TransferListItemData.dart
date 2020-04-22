import 'package:flutter/cupertino.dart';

class TransferListItemData {
  String _address;
  DateTime _date;
  TransferListItemState _state;

  TransferListItemData({
    @required address,
    @required date,
    TransferListItemState state = TransferListItemState.OFFER_CLAIM_SENT
  }) {
    _address = address;
    _date = date;
    _state = state;
  }

  TransferListItemState get state => _state;
  set state(TransferListItemState value) {
    _state = value;
  }

  DateTime get date => _date;

  String get address => _address;
}

enum TransferListItemState {
  OFFER_CLAIM_SENT,
  OFFER_RECEIVED,
  UNDER_TRANSFER,
  DONE
}