import 'package:mobx/mobx.dart';
import 'package:onlabproject/controller/TransferController.dart';

import '../model/TransferItemModel.dart';

part 'TransferData.g.dart';

class TransferData = _TransferData with _$TransferData;

abstract class _TransferData with Store {
  List<TransferItemModel> transferList = List<TransferItemModel>();

  @observable
  TransferState state = TransferState.LOADING;

/*TransferData(){
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
  }*/
}