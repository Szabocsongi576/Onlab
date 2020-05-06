import 'package:mobx/mobx.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';
import 'package:onlabproject/page_data/MyFormData.dart';

part 'TransferFlowData.g.dart';

class TransferFlowData = _TransferFlowData with _$TransferFlowData;

abstract class _TransferFlowData with Store {
  List<ObjectItemModel> objectList = List();

  DateTime selectedDate = DateTime.now();
  String selectedDayPeriod;

  @observable
  bool useProfileData = false;

  MyFormData formData =  MyFormData();

  _TransferFlowData() {
    reaction((_) => useProfileData, (_) => formData.reset());
  }
}