import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';
import 'package:onlabproject/model/TransferItemModel.dart';
import 'package:onlabproject/service/TransferListItemConvertService.dart';
import 'package:onlabproject/service/firebase/MyFirebaseDatabaseService.dart';
import 'package:onlabproject/service/firebase/MyFirebaseStorageService.dart';

part 'TransferViewModel.g.dart';

class TransferViewModel = _TransferViewModel with _$TransferViewModel;

abstract class _TransferViewModel with Store {
  @observable
  ObservableList<TransferItemModel> transferList = ObservableList<TransferItemModel>();

  @observable
  TransferState state = TransferState.LOADING;

  @action
  void addTransferItem(TransferItemModel newItem) {
    for (var item in transferList) {
      if(item.id == newItem.id) {
        return;
      }
    }

    transferList.add(newItem);
  }

  @action
  void removeTransferItem(String id) => transferList.removeWhere((TransferItemModel item) => item.id == id);

  @action
  void updateTransferItem(TransferItemModel changedItem) {
    for (int i = 0; i < transferList.length; i++) {
      if (transferList[i].id == changedItem.id) {
        print(changedItem.state);
        transferList.removeAt(i);
        transferList.insert(i, changedItem);
      }
    }
  }

  @action
  Future<void> loadTransferItems() async {
    transferList.addAll(await MyFirebaseDatabaseService.getTransferItems());
    state = TransferState.LIST_VIEW;
    registerTransferListListeners();
  }

  _TransferViewModel() {
    loadTransferItems();
  }

  void acceptOffer(int index) {
    MyFirebaseDatabaseService.updateTransferItemState(transferList[index].id, TransferListItemConvertService.getStateIdByState(TransferListItemState.UNDER_TRANSFER));
  }

  void denyOffer(int index) {
    MyFirebaseDatabaseService.removeTransferItem(transferList[index].id);
    transferList[index].objectList.forEach((item) {
      String imgName = item.imageURL.split("%2F")[1].split("?alt")[0];
      MyFirebaseStorageService.removeFile(imgName);
      print(imgName);
    });
  }

  void registerTransferListListeners() {
    MyFirebaseDatabaseService.registerTransferListChildAddedListener((
        Event event) {
      addTransferItem(TransferItemModel.fromSnapshot(
          event.snapshot.key, event.snapshot.value));
    });

    MyFirebaseDatabaseService.registerTransferListChildChangedListener((
        Event event) {
      updateTransferItem(TransferItemModel.fromSnapshot(
          event.snapshot.key, event.snapshot.value));
    });

    MyFirebaseDatabaseService.registerTransferListChildRemovedListener((
        Event event) {
      removeTransferItem(event.snapshot.key);
    });
  }
}

enum TransferState { LOADING, LIST_VIEW }