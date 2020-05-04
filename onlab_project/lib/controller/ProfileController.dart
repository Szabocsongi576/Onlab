import 'package:flutter/material.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/controller/ProfileViewModel.dart';
import 'package:onlabproject/firebase/MyFirebaseAuthManager.dart';
import 'package:onlabproject/firebase/MyFirebaseProfileManager.dart';
import 'package:onlabproject/model/ProfileData.dart';
import 'package:onlabproject/view/ProfileView.dart';
import 'package:onlabproject/view/components/MyBackground.dart';

class ProfileController extends StatefulWidget {
  @override
  _ProfileControllerState createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> implements IProfileController {

  ProfileViewModel _profileViewModel = ProfileViewModel();

  ProfileState _profileState = ProfileState.LOADING;

  _loadProfileData() async {
    _profileViewModel.data = await MyFirebaseProfileManager.getProfileData();

    setState(() {
      _profileState = ProfileState.PROFILE;
    });
  }

  save(ProfileData data) {
    MyFirebaseProfileManager.addOrUpdateProfile(data);
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
          profileViewModel: _profileViewModel,
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
  save(ProfileData data);
}

enum ProfileState { PROFILE, LOADING}
