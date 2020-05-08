import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:onlabproject/firebase/MyFirebaseDatabaseManager.dart';
import 'package:onlabproject/page_data/TransferData.dart';
import 'package:onlabproject/view/TransferView.dart';
import 'package:onlabproject/view/components/LoadingPage.dart';

class TransferController extends StatelessWidget {
  final TransferData _data = TransferData();

  TransferController() {
    _getTransferList();
  }

  Future<void> _getTransferList() async {
    _data.transferList = await MyFirebaseDatabaseManager.getTransferList();
    _data.state = TransferState.LIST_VIEW;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch(_data.state) {
          case TransferState.LIST_VIEW:
            return TransferView(list: _data.transferList);
          case TransferState.DETAILS:
            return Container(); //TODO
          default:
            return LoadingPage();
        }
      },
    );
  }
}

enum TransferState {
  LOADING,
  LIST_VIEW,
  DETAILS
}