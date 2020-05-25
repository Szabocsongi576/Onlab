import 'package:mobx/mobx.dart';

import 'MyFormViewModel.dart';

part 'ConnectionDataData.g.dart';

class ConnectionDataData = _ConnectionDataData with _$ConnectionDataData;

abstract class _ConnectionDataData with Store {
  @observable
  bool useProfileData = false;

  MyFormViewModel formData =  MyFormViewModel();

  _ConnectionDataData() {
    reaction((_) => useProfileData, (_) => formData.reset());
  }
}