import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/page_data/TransferFlowData.dart';
import 'package:onlabproject/view/components/MyButton.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';

class DateSelectView extends StatefulWidget {
  final Function onOfferClaimed;
  final TransferFlowData data;

  const DateSelectView({Key key, this.onOfferClaimed, this.data}) : super(key: key);

  @override
  _DateSelectViewState createState() => _DateSelectViewState();
}

class _DateSelectViewState extends State<DateSelectView> {
  List<String> _dayPeriodList = [
    StringResource.DV_DAY_PERIOD_AM_8_12,
    StringResource.DV_DAY_PERIOD_PM_13_17,
  ];

  _validate() {
    if(widget.data.selectedDayPeriod.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: MyBackground(
        child: Center(
          child: Container(
            width: ScreenUtil().setWidth(600),
            height: ScreenUtil.screenHeightDp,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildDatePicker(),
                  _buildDayPeriodSelect(),
                  _buildOfferClaim(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildDatePicker() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(30)),
      child: Container(
        color: Colors.white,
        child: dp.DayPicker(
          selectedDate: widget.data.selectedDate,
          onChanged: (newDate) {
            setState(() {
              widget.data.selectedDate = newDate;
            });
          },
          datePickerStyles: dp.DatePickerRangeStyles(
              selectedDateStyle: Theme.of(context)
                  .accentTextTheme
                  .body2
                  .copyWith(color: Colors.white),
              selectedSingleDateDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 115, 0),
                  shape: BoxShape.circle,
              ),
          ),
          firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ),
      ),
    );
  }

  _buildDayPeriodSelect() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                StringResource.DSV_TIME_SELECT_LABEL,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil()
                      .setSp(25, allowFontScalingSelf: true),
                ),
              ),
            ],
          ),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color.fromARGB(255, 255, 115, 0),
            ),
            child: DropdownButton<String>(
              value: widget.data.selectedDayPeriod,
              isExpanded: true,
              //itemHeight: ScreenUtil().setHeight(100),
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.white,),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.white,
              ),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String newValue) {
                setState(() {
                  widget.data.selectedDayPeriod = newValue;
                });
              },
              items: _dayPeriodList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  _buildOfferClaim() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(50)),
      child: MyButton(
        width: ScreenUtil().setWidth(400),
        text: Text(
          StringResource.DSV_OFFER_CLAIM,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(40, allowFontScalingSelf: true),
            color: Colors.white,
          ),
        ),
        onPressed: () {
          if(_validate()) {
            widget.onOfferClaimed();
          } else {
            //TODO ERROR snackbar
          }
        },
      ),
    );
  }
}
