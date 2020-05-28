import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlabproject/view/ConnectionDataView.dart';
import 'package:onlabproject/view/DateSelectView.dart';
import 'package:onlabproject/view/ObjectListView.dart';
import 'package:onlabproject/view_model/MovingFlowViewModel.dart';

class MovingFlowController extends StatelessWidget {
  final MovingFlowViewModel _viewModel = MovingFlowViewModel();

  @override
  Widget build(BuildContext context) {
    ConnectionDataView page1 = ConnectionDataView(
      viewModel: _viewModel.connectionDataViewModel,
      onNextPage: () async {
        await _viewModel.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
      onPreviousPage: () {
        Navigator.pop(context);
      },
    );
    ObjectListView page2 = ObjectListView(
      viewModel: _viewModel.objectListViewModel,
      onNextPage: () async {
        await _viewModel.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
      onPreviousPage: () async {
        await _viewModel.pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
    );
    DateSelectView page3 = DateSelectView(
      viewModel: _viewModel.dateSelectViewModel,
      onOfferClaimed: () async {
        Navigator.pop(context);
        _viewModel.uploadNewMoving();
      },
      onPreviousPage: () async {
        await _viewModel.pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
    );

    return WillPopScope(
      onWillPop: _viewModel.onWillPop,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: PageView.builder(
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _viewModel.pageController,
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
}