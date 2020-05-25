import 'package:mobx/mobx.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/page_data/MyFormViewModel.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';
import 'package:onlabproject/service/firebase/MyFirebaseDatabaseService.dart';

part 'ProfileViewModel.g.dart';

class ProfileViewModel = _ProfileViewModel with _$ProfileViewModel;

abstract class _ProfileViewModel with Store {
  ProfileState profileState = ProfileState.LOADING;
  MyFormViewModel formViewModel = MyFormViewModel();
  Function signOutCallback;

  @observable
  bool loading = false;

  Future<void> loadProfileData() async {
    ProfileModel profileModel = await MyFirebaseDatabaseService.getProfileData();

    formViewModel.textEditingControllerMap["email"].text =
          profileModel.email;
    formViewModel.textEditingControllerMap["firstName"].text =
        profileModel.firstName;
    formViewModel.textEditingControllerMap["lastName"].text =
        profileModel.lastName;
    formViewModel.textEditingControllerMap["postalCode"].text =
        profileModel.postalCode;
    formViewModel.textEditingControllerMap["city"].text =
        profileModel.city;
    formViewModel.textEditingControllerMap["streetAndNum"].text =
        profileModel.streetAndNum;
    formViewModel.textEditingControllerMap["other"].text =
        profileModel.other;
    formViewModel.textEditingControllerMap["countryCode"].text =
        profileModel.countryCode;
    formViewModel.textEditingControllerMap["tel"].text =
        profileModel.tel;
  }

  Future<void> save() async {
    loading = true;

    await MyFirebaseDatabaseService.addOrUpdateProfile(formViewModel.getProfileModel());

    loading = false;
  }

  Future<void> signOut() async {
    await MyFirebaseAuthService.signOut();
    signOutCallback();
  }
}

enum ProfileState { PROFILE, LOADING}