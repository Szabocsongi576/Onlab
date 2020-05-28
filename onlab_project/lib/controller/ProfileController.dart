import 'package:flutter/material.dart';
import 'package:onlabproject/controller/AuthController.dart';
import 'package:onlabproject/view/ProfileView.dart';
import 'package:onlabproject/view/components/LoadingPage.dart';
import 'package:onlabproject/view_model/ProfileViewModel.dart';

class ProfileController extends StatefulWidget {
  @override
  _ProfileControllerState createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> {
  final ProfileViewModel _viewModel = ProfileViewModel();

  @override
  void initState() {
    super.initState();

    _viewModel.signOutCallback = () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthController()),
      );
    };
    _viewModel.loadProfileData().then((_) {
      setState(() {
        _viewModel.profileState = ProfileState.PROFILE;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(_viewModel.profileState) {
      case ProfileState.PROFILE:
        return ProfileView(
          viewModel: _viewModel,
        );
      default:
        return LoadingPage();
    }
  }
}
