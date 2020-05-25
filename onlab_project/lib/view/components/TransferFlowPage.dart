import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/view/components/MyBackground.dart';
import 'package:page_view_indicators/step_page_indicator.dart';

class TransferFlowPage extends StatelessWidget {
  final String title;
  final Function onBackArrowTap;
  final Function onForwardArrowTap;
  final Function onBackgroundTap;
  final int pageIndex;
  final bool isLastPage;
  final Widget child;

  const TransferFlowPage(
      {Key key,
      @required this.title,
      @required this.onBackArrowTap,
      this.onForwardArrowTap,
      this.onBackgroundTap,
      @required this.pageIndex,
      this.isLastPage = false,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: onBackgroundTap,
          child: MyBackground(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, ScreenUtil.statusBarHeight, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(50),
                                vertical: ScreenUtil().setWidth(30)),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          onTap: onBackArrowTap,
                        ),
                        Container(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                          child: StepPageIndicator(
                            itemCount: 3,
                            currentPageNotifier: ValueNotifier<int>(pageIndex),
                            size: 16,
                            stepColor: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(50),
                                vertical: ScreenUtil().setWidth(30)),
                            child: Icon(
                              Icons.arrow_forward,
                              color: isLastPage ? Colors.transparent : Colors.white,
                            ),
                          ),
                          onTap: isLastPage ? (){} : onForwardArrowTap,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(50)),
                    child: Container(
                      width: ScreenUtil().setWidth(650),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(60, allowFontScalingSelf: true),
                          letterSpacing: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: child,
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
