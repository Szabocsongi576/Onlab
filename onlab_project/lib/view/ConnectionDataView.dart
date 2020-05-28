import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/view/components/MovingFlowPage.dart';
import 'package:onlabproject/view/components/MyForm.dart';
import 'package:onlabproject/view_model/ConnectionDataViewModel.dart';

import '../Resource/StringResource.dart';

class ConnectionDataView extends StatelessWidget {
  final ConnectionDataViewModel viewModel;
  final Function onNextPage;
  final Function onPreviousPage;

  const ConnectionDataView(
      {@required this.viewModel,
      @required this.onNextPage,
      @required this.onPreviousPage});

  void _nextPage(BuildContext context) {
    if (viewModel.useProfileData || viewModel.formViewModel.validate()) {
      onNextPage();
    } else {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(StringResource.SNACK_INVALID_DATA)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MovingFlowPage(
      title: StringResource.CDV_TITLE,
      onBackArrowTap: onPreviousPage,
      onForwardArrowTap: () {
        _nextPage(context);
      },
      pageIndex: 0,
      child: Column(
        children: <Widget>[
          _buildUseProfileDataCB(),
          Observer(
            builder: (_) => MyForm(
              viewModel: viewModel.formViewModel,
              enableFields: !viewModel.useProfileData,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUseProfileDataCB() {
    return Container(
      width: ScreenUtil().setWidth(650),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.white,
            ),
            child: Observer(
              builder: (_) => Checkbox(
                value: viewModel.useProfileData,
                activeColor: Color.fromARGB(255, 255, 115, 0),
                checkColor: Colors.white,
                onChanged: (bool value) {
                  viewModel.useProfileData = value;
                },
              ),
            ),
          ),
          Text(
            StringResource.CDV_USE_PROFILE_DATA_CB_TEXT,
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(35, allowFontScalingSelf: true)),
          ),
        ],
      ),
    );
  }
}
