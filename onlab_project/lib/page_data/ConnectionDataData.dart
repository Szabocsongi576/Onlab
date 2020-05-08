import 'package:mobx/mobx.dart';
import 'package:onlabproject/page_data/MyFormData.dart';

part 'ConnectionDataData.g.dart';

class ConnectionDataData = _ConnectionDataData with _$ConnectionDataData;

abstract class _ConnectionDataData with Store {
  @observable
  bool useProfileData = false;

  MyFormData formData =  MyFormData();

  _ConnectionDataData() {
    reaction((_) => useProfileData, (_) => formData.reset());
  }
}