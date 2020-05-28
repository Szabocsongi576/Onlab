import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:onlabproject/view/MovingView.dart';
import 'package:onlabproject/view/components/LoadingPage.dart';
import 'package:onlabproject/view_model/MovingViewModel.dart';

class MovingController extends StatelessWidget {
  final MovingViewModel _viewModel = MovingViewModel();

  MovingController() {
    _viewModel.loadMovingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (_viewModel.state) {
          case MovingState.LIST_VIEW:
            return MovingView(
              list: _viewModel.movingList,
              onItemAccept: _viewModel.acceptOffer,
              onItemDeny: _viewModel.denyOffer,
            );
          default:
            return LoadingPage();
        }
      },
    );
  }
}
