import 'package:flutter/material.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/page_data/MyFormData.dart';
import 'package:onlabproject/firebase/MyFirebaseAuthManager.dart';
import 'package:onlabproject/firebase/MyFirebaseDatabaseManager.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/view/ProfileView.dart';
import 'package:onlabproject/view/components/MyBackground.dart';

class ProfileController extends StatefulWidget {
  @override
  _ProfileControllerState createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> implements IProfileController {
  MyFormData _formData = MyFormData();
  ProfileModel _profileModel;

  ProfileState _profileState = ProfileState.LOADING;

  _loadProfileData() async {
    _profileModel = await MyFirebaseDatabaseManager.getProfileData();

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
    ProfileModel data = ProfileModel(
      email:  _formData.textEditingControllerMap["email"].text,
      firstName:  _formData.textEditingControllerMap["firstName"].text,
      lastName:  _formData.textEditingControllerMap["lastName"].text,
      postalCode:  _formData.textEditingControllerMap["postalCode"].text,
      city:  _formData.textEditingControllerMap["city"].text,
      streetAndNum:  _formData.textEditingControllerMap["streetAndNum"].text,
      other:  _formData.textEditingControllerMap["other"].text,
      countryCode:  _formData.textEditingControllerMap["countryCode"].text,
      tel: _formData.textEditingControllerMap["tel"].text,
    );

    //TODO save loading display

    MyFirebaseDatabaseManager.addOrUpdateProfile(data);
  }

  @override
  void signOut() {
    MyFirebaseAuthManager.signOut();

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
