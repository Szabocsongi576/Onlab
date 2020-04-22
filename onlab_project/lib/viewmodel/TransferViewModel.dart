import '../model/TransferListItemData.dart';

class TransferViewModel {
  List<TransferListItemData> _transferList = List<TransferListItemData>();
  List<TransferListItemData> get transferList => _transferList;

  TransferViewModel(){
    _transferList.add(TransferListItemData(
      address: "asd",
      date: DateTime.now(),
      state: TransferListItemState.DONE,
    ));
    _transferList.add(TransferListItemData(
      address: "asd",
      date: DateTime.now(),
      state: TransferListItemState.OFFER_CLAIM_SENT,
    ));
    _transferList.add(TransferListItemData(
      address: "asd",
      date: DateTime.now(),
      state: TransferListItemState.OFFER_RECEIVED,
    ));
    _transferList.add(TransferListItemData(
      address: "asd",
      date: DateTime.now(),
      state: TransferListItemState.UNDER_TRANSFER,
    ));
  }


}