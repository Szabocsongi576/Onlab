import 'package:mobx/mobx.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';

import 'MyFormViewModel.dart';

part 'TransferFlowData.g.dart';

class TransferFlowData = _TransferFlowData with _$TransferFlowData;

abstract class _TransferFlowData with Store {
  List<ObjectItemModel> objectList = List();

  DateTime selectedDate = DateTime.now();
  String selectedDayPeriod;

  @observable
  bool useProfileData = false;

  MyFormViewModel formData =  MyFormViewModel();

  _TransferFlowData() {
    reaction((_) => useProfileData, (_) => formData.reset());
  }
}