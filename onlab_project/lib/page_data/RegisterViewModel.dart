import 'package:mobx/mobx.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';

import 'MyFormViewModel.dart';

part 'RegisterViewModel.g.dart';

class RegisterViewModel = _RegisterViewModel with _$RegisterViewModel;

abstract class _RegisterViewModel with Store {
  MyFormViewModel formViewModel = MyFormViewModel();

  Future<bool> register(){
    return MyFirebaseAuthService.register(
      formViewModel.email,
      formViewModel.password,
      formViewModel.getProfileModel(),
    );
  }
}
