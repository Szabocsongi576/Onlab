import 'package:flutter/material.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';
import 'package:onlabproject/service/firebase/MyFirebaseDatabaseService.dart';
import 'package:onlabproject/view/ProfileView.dart';
import 'package:onlabproject/view/components/MyBackground.dart';

import '../page_data/MyFormViewModel.dart';

class ProfileController extends StatefulWidget {
  @override
  _ProfileControllerState createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> implements IProfileController {
  MyFormViewModel _formData = MyFormViewModel();
  ProfileModel _profileModel;

  ProfileState _profileState = ProfileState.LOADING;

  _loadProfileData() async {
    _profileModel = await MyFirebaseDatabaseService.getProfileData();

    _formData.textEditingControllerMap["email"].text = _profileModel.email;
    _formData.textEditingControllerMap["firstName"].text = _profileModel.firstName;
    _formData.textEditingControllerMap["lastName"].text = _profileModel.lastName;
    _formData.textEditingControllerMap["postalCode"].text = _profileModel.postalCode;
    _formData.textEditingControllerMap["city"].text = _profileModel.city;
    _formData.textEditingControllerMap["streetAndNum"].text = _profileModel.streetAndNum;
    _formData.textEditingControllerMap["other"].text = _profileModel.other;
    _formData.textEditingControllerMap["countryCode"].text = _profileModel.countryCode;
    _formData.textEditingControllerMap["tel"].text = _profileModel.tel;

    setState(() {
      _profileState = ProfileState.PROFILE;
    });
  }

  @override
  void initState() {
    super.initState();

    _loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    switch(_profileState) {
      case ProfileState.PROFILE:
        return ProfileView(
          profileController: this,
          formData: _formData,
        );
      default:
        return MyBackground(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        );
    }
  }

  @override
  void save() {
    //TODO save loading display
    MyFirebaseDatabaseService.addOrUpdateProfile(_formData.getProfileModel());
  }

  @override
  void signOut() {
    MyFirebaseAuthService.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthController()),
    );
  }
}

abstract class IProfileController {
  void signOut();
  void save();
}

enum ProfileState { PROFILE, LOADING}
