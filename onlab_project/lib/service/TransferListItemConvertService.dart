import 'package:flutter/material.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/model/TransferItemModel.dart';

class TransferListItemConvertService {
  static String getStringFromEnumValue(TransferListItemState state) {
    switch (state) {
      case TransferListItemState.OFFER_CLAIM_SENT :
        return StringResource.TRANSFER_LIST_ITEM_OFFER_CLAIM_SENT;
      case TransferListItemState.OFFER_RECEIVED :
        return StringResource.TRANSFER_LIST_ITEM_OFFER_VIEW;
      case TransferListItemState.UNDER_TRANSFER :
        return StringResource.TRANSFER_LIST_ITEM_UNDER_TRANSFER;
      case TransferListItemState.DONE:
        return StringResource.TRANSFER_LIST_ITEM_DONE;
      default :
        return null;
    }
  }

  static TransferListItemState getEnumValueFromString(String state) {
    switch (state) {
      case StringResource.TRANSFER_LIST_ITEM_OFFER_CLAIM_SENT :
        return TransferListItemState.OFFER_CLAIM_SENT;
      case StringResource.TRANSFER_LIST_ITEM_OFFER_VIEW :
        return TransferListItemState.OFFER_RECEIVED;
      case StringResource.TRANSFER_LIST_ITEM_UNDER_TRANSFER :
        return TransferListItemState.UNDER_TRANSFER;
      case StringResource.TRANSFER_LIST_ITEM_DONE:
        return TransferListItemState.DONE;
      default :
        return null;
    }
  }

  static Color getSStatusBarColorByState(TransferListItemState state) {
    switch (state) {
      case TransferListItemState.OFFER_CLAIM_SENT :
        return Colors.white;
      case TransferListItemState.OFFER_RECEIVED :
        return Color.fromARGB(255, 255, 115, 0);
      case TransferListItemState.UNDER_TRANSFER :
        return Color.fromARGB(255, 70, 151, 46);
      default:
        return Color.fromARGB(255, 145, 142, 141);
    }
  }

  static Color getSStatusBarTextColorByState(TransferListItemState state) {
    if (state == TransferListItemState.OFFER_CLAIM_SENT) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  static TransferListItemState getStateByStateId(int id) {
    switch (id) {
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

  static int getStateIdByState(TransferListItemState state) {
    switch (state) {
      case TransferListItemState.OFFER_CLAIM_SENT:
        return 0;
      case TransferListItemState.OFFER_RECEIVED:
        return 1;
      case TransferListItemState.UNDER_TRANSFER:
        return 2;
      default:
        return 3;
    }
  }
}