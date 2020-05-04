import '../model/TransferItemModel.dart';

class TransferData {
  List<TransferItemModel> transferList = List<TransferItemModel>();

  TransferData(){
    transferList.add(TransferItemModel(
      address: "asd",
      date: DateTime.now(),
      state: TransferListItemState.DONE,
    ));
    transferList.add(TransferItemModel(
      address: "asd",
      date: DateTime.now(),
      state: TransferListItemState.OFFER_CLAIM_SENT,
    ));
    transferList.add(TransferItemModel(
      address: "asd",
      date: DateTime.now(),
      state: TransferListItemState.OFFER_RECEIVED,
    ));
    transferList.add(TransferItemModel(
      address: "asd",
      date: DateTime.now(),
      state: TransferListItemState.UNDER_TRANSFER,
    ));
  }


}