import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/view/components/TransferFlowPage.dart';
import 'package:onlabproject/page_data/ConnectionDataData.dart';
import 'package:onlabproject/view/components/MyForm.dart';

import '../Resource/StringResource.dart';

class ConnectionDataView extends StatelessWidget {
  final ConnectionDataData data;
  final Function onNextPage;
  final Function onPreviousPage;

  const ConnectionDataView(
      {@required this.data,
      @required this.onNextPage,
      @required this.onPreviousPage});

  _nextPage(BuildContext context) {
    if (data.useProfileData || data.formData.validate()) {
      onNextPage();
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(StringResource.SNACK_INVALID_DATA)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TransferFlowPage(
      title: StringResource.CDV_TITLE,
      onBackArrowTap: onPreviousPage,
      onForwardArrowTap:() { _nextPage(context); },
      pageIndex: 0,
      child: Column(
        children: <Widget>[
          _buildUseProfileDataCB(),
          Observer(
            builder: (_) => MyForm(
              viewModel: data.formData,
              enableFields: !data.useProfileData,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUseProfileDataCB() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.white,
          ),
          child: Observer(
            builder: (_) => Checkbox(
              value: data.useProfileData,
              activeColor: Color.fromARGB(255, 255, 115, 0),
              checkColor: Colors.white,
              onChanged: (bool value) {
                data.useProfileData = value;
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
    );
  }
}
