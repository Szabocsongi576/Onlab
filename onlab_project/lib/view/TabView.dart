import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/controller/ProfileController.dart';

import 'ContactView.dart';
import 'ProfileView.dart';
import 'TransferView.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
      controller: _tabController,
      tabs: [
        Tab(
          icon: Image.asset(
            'assets/baseline_local_shipping_black_18dp.png',
            height: ScreenUtil().setWidth(60),
            width: ScreenUtil().setWidth(60),
          ),
        ),
        Tab(
          icon: Image.asset(
            'assets/baseline_alternate_email_black_18dp.png',
            height: ScreenUtil().setWidth(60),
            width: ScreenUtil().setWidth(60),
          ),
        ),
        Tab(
          icon: Image.asset(
            'assets/baseline_account_box_black_18dp.png',
            height: ScreenUtil().setWidth(60),
            width: ScreenUtil().setWidth(60),
          ),
        ),
      ],
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Color.fromARGB(255, 255, 115, 0),
    );
    return WillPopScope(
        child: Scaffold(
          body: TabBarView(
            controller: _tabController,
            children: [
              TransferView(),
              ContactView(),
              ProfileController(),
            ],
          ),
          bottomNavigationBar: (Platform.isIOS)
              ? Container(
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.topCenter,
            child: tabBar,
          )
              : tabBar,
        ),
        onWillPop: () {
          if (_tabController.index != 0) _tabController.animateTo(0);
          return Future.value(false);
        });
  }
}