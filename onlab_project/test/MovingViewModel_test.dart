import 'package:flutter_test/flutter_test.dart';
import 'package:onlabproject/model/MovingItemModel.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';
import 'package:onlabproject/view_model/MovingViewModel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Moving list", () {
    final MovingViewModel viewModel = MovingViewModel();

    test('Add new moving to list from snapshot', () {
      List<ObjectItemModel> list = List<ObjectItemModel>();
      list.add(ObjectItemModel(
        id: "-M8QY37AWva8UxlhJIME",
        name: "tárgy",
        piece: 3,
      ));

      viewModel.addMovingItem(
          MovingItemModel(
            id: "-M8QY37AWva8UxlhJYUf",
            date: DateTime.fromMillisecondsSinceEpoch(1590673772368),
            address: "Cím",
            name: "Név",
            timeInterval: "Idősáv",
            tel: "+36201234567",
            state: MovingListItemState.DONE,
            objectList: list,
          )
      );

      expect(viewModel.movingList[0].date, DateTime.fromMillisecondsSinceEpoch(1590673772368));
      expect(viewModel.movingList[0].address, "Cím");
      expect(viewModel.movingList[0].name, "Név");
      expect(viewModel.movingList[0].timeInterval, "Idősáv");
      expect(viewModel.movingList[0].tel, "+36201234567");
      expect(viewModel.movingList[0].state, MovingListItemState.DONE);

      expect(viewModel.movingList[0].objectList[0].id, "-M8QY37AWva8UxlhJIME");
      expect(viewModel.movingList[0].objectList[0].name, "tárgy");
      expect(viewModel.movingList[0].objectList[0].piece, 3);
      expect(viewModel.movingList[0].objectList[0].imageURL, null);
    });

    test('Remove moving from list', () {
      viewModel.removeMovingItem("-M8QY37AWva8UxlhJYUf");

      bool exists = false;
      viewModel.movingList.forEach((item) {
        if(item.id == "-M8QY37AWva8UxlhJYUf")
          exists = true;
      });

      expect(exists, false);
    });
  });
}