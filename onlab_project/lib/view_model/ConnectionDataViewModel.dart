import 'package:mobx/mobx.dart';

import 'MyFormViewModel.dart';

part 'ConnectionDataViewModel.g.dart';

class ConnectionDataViewModel = _ConnectionDataViewModel with _$ConnectionDataViewModel;

abstract class _ConnectionDataViewModel with Store {
  @observable
  bool useProfileData = false;

  MyFormViewModel formViewModel =  MyFormViewModel();

  _ConnectionDataViewModel() {
    reaction((_) => useProfileData, (_) => formViewModel.reset());
  }
}