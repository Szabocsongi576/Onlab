import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/page_data/TransferFlowData.dart';
import 'package:onlabproject/view/ConnectionDataView.dart';
import 'package:onlabproject/view/DateSelectView.dart';
import 'package:onlabproject/view/ObjectListView.dart';
import 'package:page_view_indicators/step_page_indicator.dart';

class TransferFlowController extends StatefulWidget {
  @override
  _TransferFlowControllerState createState() => _TransferFlowControllerState();
}

class _TransferFlowControllerState extends State<TransferFlowController> {
  final _pageController = PageController(initialPage: 0);
  final _currentPageNotifier = ValueNotifier<int>(0);

  int _currentPage = 0;

  TransferFlowData data;

  ConnectionDataView page1;
  ObjectListView page2;
  DateSelectView page3;

  String _getTitle() {
    switch(_currentPage) {
      case 0:
        return StringResource.CDV_TITLE;
      case 1:
        return StringResource.OLV_TITLE;
      default:
        return StringResource.DSV_TITLE;
    }
  }

  @override
  void initState() {
    super.initState();

    data = TransferFlowData();

    page1 = ConnectionDataView(
      data: data,
      onPageChanged: () async {
        await _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        setState(() {
          _currentPage = 1;
        }); //TODO MOBX
      },
    );
    page2 = ObjectListView(
      data: data,
      onPageChanged: () async {
        await _pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        setState(() {
          _currentPage = 2;
        }); //TODO MOBX
      },
    );
    page3 = DateSelectView(
      data: data,
      onOfferClaimed: () async {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_getTitle()),
          backgroundColor: Color.fromARGB(255, 255, 115, 0),
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildStepIndicator(),
        _buildPageView(),
      ],
    );
  }

  _buildPageView() {
    return Expanded(
      child: PageView.builder(
        itemCount: 3,
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
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
        onPageChanged: (index) {
          _currentPageNotifier.value = index;
        },
      ),
    );
  }

  _buildStepIndicator() {
    return Container(
      color: Color.fromARGB(127, 255, 115, 0),
      padding: const EdgeInsets.all(16.0),
      child: StepPageIndicator(
        itemCount: 3,
        currentPageNotifier: _currentPageNotifier,
        size: 16,
        stepColor: Colors.white,
      ),
    );
  }

  Future<bool> _onWillPop() async {
    switch(_currentPageNotifier.value) {
      case 1:
        await _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        setState(() {
          _currentPage = 0;
        }); //TODO MOBX
        return false;
      case 2:
        await _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        setState(() {
          _currentPage = 1;
        }); //TODO MOBX
        return false;
      default:
        return true;
    }
  }
}
