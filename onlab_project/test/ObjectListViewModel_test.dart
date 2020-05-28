import 'package:flutter_test/flutter_test.dart';
import 'package:onlabproject/view_model/ObjectListViewModel.dart';

void main() {
  test('Add object to list', () {
    final viewModel = ObjectListViewModel();

    viewModel.objectName = "Szekrény";
    viewModel.piece = 2;

    viewModel.addListItem();

    expect(viewModel.objectList[0].imageURL, null);
    expect(viewModel.objectList[0].name, "Szekrény");
    expect(viewModel.objectList[0].piece, 2);
  });
}