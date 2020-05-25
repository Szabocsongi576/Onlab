import 'package:mobx/mobx.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';

import 'MyFormViewModel.dart';

part 'TransferFlowViewModel.g.dart';

class TransferFlowViewModel = _TransferFlowViewModel with _$TransferFlowViewModel;

abstract class _TransferFlowViewModel with Store {
  List<ObjectItemModel> objectList = List();

  DateTime selectedDate = DateTime.now();
  String selectedDayPeriod;

  @observable
  bool useProfileData = false;

  MyFormViewModel formViewModel =  MyFormViewModel();

  _TransferFlowViewModel() {
    reaction((_) => useProfileData, (_) => formViewModel.reset());
  }
}