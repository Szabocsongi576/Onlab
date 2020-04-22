import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/model/TransferListItemData.dart';

class TransferListItemStateConverter {
  static String getStringFromEnumValue(TransferListItemState state) {
    switch(state) {
      case TransferListItemState.OFFER_CLAIM_SENT : return StringResource.TRANSFER_LIST_ITEM_OFFER_CLAIM_SENT;
      case TransferListItemState.OFFER_RECEIVED : return StringResource.TRANSFER_LIST_ITEM_OFFER_VIEW;
      case TransferListItemState.UNDER_TRANSFER : return StringResource.TRANSFER_LIST_ITEM_UNDER_TRANSFER;
      case TransferListItemState.DONE: return StringResource.TRANSFER_LIST_ITEM_DONE;
      default : return null;
    }
  }

  static TransferListItemState getEnumValueFromString(String state) {
    switch(state) {
      case StringResource.TRANSFER_LIST_ITEM_OFFER_CLAIM_SENT : return TransferListItemState.OFFER_CLAIM_SENT;
      case StringResource.TRANSFER_LIST_ITEM_OFFER_VIEW : return TransferListItemState.OFFER_RECEIVED;
      case StringResource.TRANSFER_LIST_ITEM_UNDER_TRANSFER : return TransferListItemState.UNDER_TRANSFER;
      case StringResource.TRANSFER_LIST_ITEM_DONE: return TransferListItemState.DONE;
      default : return null;
    }
  }
}