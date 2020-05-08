import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlabproject/firebase/MyFirebaseAuthManager.dart';
import 'package:onlabproject/firebase/MyFirebaseDatabaseManager.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/model/TransferItemModel.dart';
import 'package:onlabproject/page_data/ConnectionDataData.dart';
import 'package:onlabproject/page_data/DateSelectData.dart';
import 'package:onlabproject/page_data/ObjectListData.dart';
import 'package:onlabproject/view/ConnectionDataView.dart';
import 'package:onlabproject/view/DateSelectView.dart';
import 'package:onlabproject/view/ObjectListView.dart';

class TransferFlowController extends StatelessWidget {

  final _pageController = PageController(initialPage: 0);

  final ConnectionDataData _connectionDataData = ConnectionDataData();
  final DateSelectData _dateSelectData = DateSelectData();
  final ObjectListData _objectListData = ObjectListData();

  Future<void> _uploadNewTransfer() async {
    ProfileModel profileModel;

    if(_connectionDataData.useProfileData) {
     profileModel = await MyFirebaseDatabaseManager.getProfileData();
    } else {
      profileModel = _connectionDataData.formData.getProfileModel();
    }

    String address = profileModel.postalCode.toString() + ", "
        + profileModel.city + " " + profileModel.streetAndNum;
    if(profileModel.other != null)
      address = address +  " " + profileModel.other;

    String name = profileModel.firstName + " " + profileModel.lastName;

    TransferItemModel newItem = TransferItemModel(
      state: TransferListItemState.OFFER_CLAIM_SENT,
      address: address,
      name: name,
      tel: profileModel.tel,
      objectList: _objectListData.objectList,
      date: _dateSelectData.selectedDate,
      timeInterval: _dateSelectData.selectedInterval,
    );

    print(newItem.toJson());
    MyFirebaseDatabaseManager.addOrUpdateTransferItem(newItem);
  }

  @override
  Widget build(BuildContext context) {

    ConnectionDataView page1 = ConnectionDataView(
      data: _connectionDataData,
      onNextPage: () async {
        await _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
      onPreviousPage: () {
        Navigator.pop(context);
      },
    );
    ObjectListView page2 = ObjectListView(
      data: _objectListData,
      onNextPage: () async {
        await _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
      onPreviousPage: () async {
        await _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
    );
    DateSelectView page3 = DateSelectView(
      data: _dateSelectData,
      onOfferClaimed: () async {
        Navigator.pop(context);
        print("xdd");
        _uploadNewTransfer();
        print("xddxdd");
      },
      onPreviousPage: () async {
        await _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
    );

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: PageView.builder(
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (BuildContext context, int index) {
                    switch (index) {
                      case 1:
                        return page2;
                      case 2:
                        return page3;
                      default:
                        return page1;
                    }
                  },
                  onPageChanged: (_) {},
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if(_pageController.page.round() == 0) {
      return true;
    } else {
      await _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      return false;
    }
  }
}