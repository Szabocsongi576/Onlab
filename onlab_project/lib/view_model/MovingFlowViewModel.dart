import 'package:flutter/material.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/model/MovingItemModel.dart';
import 'package:onlabproject/service/firebase/MyFirebaseDatabaseService.dart';
import 'package:onlabproject/view_model/ConnectionDataViewModel.dart';
import 'package:onlabproject/view_model/DateSelectViewModel.dart';
import 'package:onlabproject/view_model/ObjectListViewModel.dart';

class MovingFlowViewModel {
  final ConnectionDataViewModel connectionDataViewModel = ConnectionDataViewModel();
  final DateSelectViewModel dateSelectViewModel = DateSelectViewModel();
  final ObjectListViewModel objectListViewModel = ObjectListViewModel();

  final pageController = PageController(initialPage: 0);

  Future<void> uploadNewMoving() async {
    ProfileModel profileModel;

    if(connectionDataViewModel.useProfileData) {
      profileModel = await MyFirebaseDatabaseService.getProfileData();
    } else {
      profileModel = connectionDataViewModel.formViewModel.getProfileModel();
    }

    String address = profileModel.postalCode.toString() + ", " + profileModel.city + " " + profileModel.streetAndNum;
    if(profileModel.other != null)
      address = address +  " " + profileModel.other;

    String name = profileModel.firstName + " " + profileModel.lastName;

    MovingItemModel newItem = MovingItemModel(
      state: MovingListItemState.OFFER_CLAIM_SENT,
      address: address,
      name: name,
      tel: profileModel.tel,
      objectList: objectListViewModel.objectList,
      date: dateSelectViewModel.selectedDate,
      timeInterval: dateSelectViewModel.selectedInterval,
    );

    MyFirebaseDatabaseService.addMovingItem(newItem, objectListViewModel.images);
  }

  Future<bool> onWillPop() async {
    if(pageController.page.round() == 0) {
      return true;
    } else {
      await pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      return false;
    }
  }
}