import 'package:flutter/material.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/model/MovingItemModel.dart';

class MovingListItemConvertService {
  static String getStringFromEnumValue(MovingListItemState state) {
    switch (state) {
      case MovingListItemState.OFFER_CLAIM_SENT :
        return StringResource.MOVING_LIST_ITEM_OFFER_CLAIM_SENT;
      case MovingListItemState.OFFER_RECEIVED :
        return StringResource.MOVING_LIST_ITEM_OFFER_VIEW;
      case MovingListItemState.UNDER_TRANSFER :
        return StringResource.MOVING_LIST_ITEM_UNDER_TRANSFER;
      case MovingListItemState.DONE:
        return StringResource.MOVING_LIST_ITEM_DONE;
      default :
        return null;
    }
  }

  static MovingListItemState getEnumValueFromString(String state) {
    switch (state) {
      case StringResource.MOVING_LIST_ITEM_OFFER_CLAIM_SENT :
        return MovingListItemState.OFFER_CLAIM_SENT;
      case StringResource.MOVING_LIST_ITEM_OFFER_VIEW :
        return MovingListItemState.OFFER_RECEIVED;
      case StringResource.MOVING_LIST_ITEM_UNDER_TRANSFER :
        return MovingListItemState.UNDER_TRANSFER;
      case StringResource.MOVING_LIST_ITEM_DONE:
        return MovingListItemState.DONE;
      default :
        return null;
    }
  }

  static Color getSStatusBarColorByState(MovingListItemState state) {
    switch (state) {
      case MovingListItemState.OFFER_CLAIM_SENT :
        return Colors.white;
      case MovingListItemState.OFFER_RECEIVED :
        return Color.fromARGB(255, 255, 115, 0);
      case MovingListItemState.UNDER_TRANSFER :
        return Color.fromARGB(255, 70, 151, 46);
      default:
        return Color.fromARGB(255, 145, 142, 141);
    }
  }

  static Color getSStatusBarTextColorByState(MovingListItemState state) {
    if (state == MovingListItemState.OFFER_CLAIM_SENT) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  static MovingListItemState getStateByStateId(int id) {
    switch (id) {
      case 0:
        return MovingListItemState.OFFER_CLAIM_SENT;
      case 1:
        return MovingListItemState.OFFER_RECEIVED;
      case 2:
        return MovingListItemState.UNDER_TRANSFER;
      default:
        return MovingListItemState.DONE;
    }
  }

  static int getStateIdByState(MovingListItemState state) {
    switch (state) {
      case MovingListItemState.OFFER_CLAIM_SENT:
        return 0;
      case MovingListItemState.OFFER_RECEIVED:
        return 1;
      case MovingListItemState.UNDER_TRANSFER:
        return 2;
      default:
        return 3;
    }
  }
}