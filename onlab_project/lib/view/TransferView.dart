import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/controller/TransferFlowController.dart';
import 'package:onlabproject/model/TransferItemModel.dart';
import 'package:onlabproject/page_data/TransferViewModel.dart';
import 'package:onlabproject/view/TransferDetailsView.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';
import 'components/MyButton.dart';
import 'components/TransferListItem.dart';

class TransferView extends StatelessWidget {
  final List<TransferItemModel> list;
  final Function onItemAccept;
  final Function onItemDeny;

  const TransferView(
      {Key key,
      @required this.list,
      @required this.onItemAccept,
      @required this.onItemDeny})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBackground(
        child: Center(
          child: Container(
            width: ScreenUtil().setWidth(700),
            height: ScreenUtil.screenHeightDp,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.statusBarHeight +
                        ScreenUtil().setHeight(100),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          StringResource.TRANSFER_TITLE.toUpperCase(),
                          style: TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(60, allowFontScalingSelf: true),
                            letterSpacing: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(80)),
                    child: Observer(
                      builder: (_) => ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(15)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransferDetailsView(
                                    model: list[index],
                                    onAccept: () {
                                      if (list[index].state ==
                                          TransferListItemState
                                              .OFFER_RECEIVED) {
                                        onItemAccept(list[index].id);
                                      }
                                    },
                                    onDeny: () {
                                      if (list[index].state ==
                                          TransferListItemState
                                              .OFFER_RECEIVED) {
                                        onItemDeny(list[index].id);
                                      }
                                    },
                                  ),
                                ),
                              );
                            },
                            child: TransferListItem(list[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(80)),
                    child: MyButton(
                      text: Text(
                        StringResource.TRANSFER_NEW_BUTTON_TEXT,
                        style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(35, allowFontScalingSelf: true),
                          color: Colors.white,
                        ),
                      ),
                      width: ScreenUtil().setWidth(450),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TransferFlowController()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
