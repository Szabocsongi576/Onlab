import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/controller/MovingFlowController.dart';
import 'package:onlabproject/model/MovingItemModel.dart';
import 'package:onlabproject/view/MovingDetailsView.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';
import 'components/MyButton.dart';
import 'components/MovingListItem.dart';

class MovingView extends StatelessWidget {
  final List<MovingItemModel> list;
  final Function onItemAccept;
  final Function onItemDeny;

  const MovingView(
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
                          StringResource.MOVING_TITLE.toUpperCase(),
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
                                  builder: (context) => MovingDetailsView(
                                    model: list[index],
                                    onAccept: () {
                                      if (list[index].state ==
                                          MovingListItemState
                                              .OFFER_RECEIVED) {
                                        onItemAccept(index);
                                      }
                                    },
                                    onDeny: () {
                                      if (list[index].state ==
                                          MovingListItemState
                                              .OFFER_RECEIVED) {
                                        onItemDeny(index);
                                      }
                                    },
                                  ),
                                ),
                              );
                            },
                            child: MovingListItem(list[index]),
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
                        StringResource.MOVING_NEW_BUTTON_TEXT,
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
                                    MovingFlowController()));
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
