import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import 'package:onlabproject/model/MovingItemModel.dart';
import 'package:onlabproject/service/MovingListItemConvertService.dart';
import 'package:onlabproject/service/firebase/MyFirebaseDatabaseService.dart';
import 'package:onlabproject/service/firebase/MyFirebaseStorageService.dart';

part 'MovingViewModel.g.dart';

class MovingViewModel = _MovingViewModel with _$MovingViewModel;

abstract class _MovingViewModel with Store {
  @observable
  ObservableList<MovingItemModel> movingList = ObservableList<MovingItemModel>();

  @observable
  MovingState state = MovingState.LOADING;

  @action
  void addMovingItem(MovingItemModel newItem) {
    for (var item in movingList) {
      if(item.id == newItem.id) {
        return;
      }
    }

    movingList.add(newItem);
  }

  @action
  void removeMovingItem(String id) => movingList.removeWhere((MovingItemModel item) => item.id == id);

  @action
  void updateMovingItem(MovingItemModel changedItem) {
    for (int i = 0; i < movingList.length; i++) {
      if (movingList[i].id == changedItem.id) {
        print(changedItem.state);
        movingList.removeAt(i);
        movingList.insert(i, changedItem);
      }
    }
  }

  @action
  Future<void> loadMovingItems() async {
    movingList.addAll(await MyFirebaseDatabaseService.getMovingItems());
    state = MovingState.LIST_VIEW;
    registerMovingListListeners();
  }



  void acceptOffer(int index) {
    MyFirebaseDatabaseService.updateMovingItemState(movingList[index].id, MovingListItemConvertService.getStateIdByState(MovingListItemState.UNDER_TRANSFER));
  }

  void denyOffer(int index) {
    MyFirebaseDatabaseService.removeMovingItem(movingList[index].id);
    movingList[index].objectList.forEach((item) {
      if(item.imageURL != null) {
        String imgName = item.imageURL.split("%2F")[1].split("?alt")[0];
        MyFirebaseStorageService.removeFile(imgName);
      }
    });
  }

  void registerMovingListListeners() {
    MyFirebaseDatabaseService.registerMovingListChildAddedListener((
        Event event) {
      addMovingItem(MovingItemModel.fromSnapshot(
          event.snapshot.key, event.snapshot.value));
    });

    MyFirebaseDatabaseService.registerMovingListChildChangedListener((
        Event event) {
      updateMovingItem(MovingItemModel.fromSnapshot(
          event.snapshot.key, event.snapshot.value));
    });

    MyFirebaseDatabaseService.registerMovingListChildRemovedListener((
        Event event) {
      removeMovingItem(event.snapshot.key);
    });
  }
}

enum MovingState { LOADING, LIST_VIEW }