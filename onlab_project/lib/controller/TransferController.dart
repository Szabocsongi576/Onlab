import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:onlabproject/page_data/TransferViewModel.dart';
import 'package:onlabproject/view/TransferView.dart';
import 'package:onlabproject/view/components/LoadingPage.dart';

class TransferController extends StatelessWidget {
  final TransferViewModel _viewModel = TransferViewModel();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (_viewModel.state) {
          case TransferState.LIST_VIEW:
            return TransferView(
              list: _viewModel.transferList,
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
