import 'package:mobx/mobx.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';

import 'MyFormViewModel.dart';

part 'RegisterViewModel.g.dart';

class RegisterViewModel = _RegisterViewModel with _$RegisterViewModel;

abstract class _RegisterViewModel with Store {
  MyFormViewModel formViewModel = MyFormViewModel();

  @observable
  bool loading = false;

  Future<void> register({Function callback, Function invalid}) async {
    loading = true;

    formViewModel.loseFocus();
    if (formViewModel.validate()) {
      bool succeed = await MyFirebaseAuthService.register(
        formViewModel.email,
        formViewModel.password,
        formViewModel.getProfileModel(),
      );
      callback(succeed);
    } else {
      invalid();
    }

    loading = false;
  }
}
