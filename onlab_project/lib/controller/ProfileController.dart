import 'package:flutter/material.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/page_data/ProfileData.dart';
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

  ProfileData _data = ProfileData();

  ProfileState _profileState = ProfileState.LOADING;

  _loadProfileData() async {
    _data.data = await MyFirebaseDatabaseManager.getProfileData();

    setState(() {
      _profileState = ProfileState.PROFILE;
    });
  }

  save(ProfileModel data) {
    MyFirebaseDatabaseManager.addOrUpdateProfile(data);
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
          data: _data,
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
  save(ProfileModel data);
}

enum ProfileState { PROFILE, LOADING}
