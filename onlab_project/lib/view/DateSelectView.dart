import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/page_data/DateSelectViewModel.dart';
import 'package:onlabproject/view/components/MyButton.dart';
import 'package:onlabproject/view/components/TransferFlowPage.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Resource/StringResource.dart';

class DateSelectView extends StatelessWidget {
  final Function onOfferClaimed;
  final Function onPreviousPage;
  final DateSelectViewModel viewModel;

  DateSelectView(
      {Key key,
      @required this.onOfferClaimed,
      @required this.viewModel,
      @required this.onPreviousPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransferFlowPage(
      title: StringResource.DSV_TITLE,
      onBackArrowTap: onPreviousPage,
      pageIndex: 2,
      isLastPage: true,
      child: Container(
        width: ScreenUtil().setWidth(600),
        height: ScreenUtil.screenHeightDp,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildDatePicker(context),
              _buildDayPeriodSelect(context),
              _buildOfferClaim(),
            ],
          ),
        ),
      ),
    );
  }

  _buildDatePicker(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(30)),
      child: Container(
        width: ScreenUtil().setWidth(610),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: TableCalendar(
          calendarController: viewModel.calendarController,
          initialSelectedDay: DateTime.now(),
          startDay: viewModel.selectedDate,
          onDaySelected: (date, _) {
            viewModel.selectedDate = date;
          },
          availableCalendarFormats: {
            CalendarFormat.month: 'Month',
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: viewModel.headerStyle,
          daysOfWeekStyle: viewModel.daysOfWeekStyle,
          calendarStyle: CalendarStyle(
            todayColor: Colors.transparent,
            todayStyle: const TextStyle(color: Colors.black),
            selectedColor: const Color.fromARGB(255, 255, 115, 0),
            selectedStyle: const TextStyle(color: Colors.white),
            weekendStyle: const TextStyle(color: Colors.black),
            weekdayStyle: const TextStyle(color: Colors.black),
            outsideWeekendStyle: const TextStyle(color: const Color(0xFF9E9E9E)),
          ),
        ),
      ),
      //),
    );
  }

  _buildDayPeriodSelect(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
      child: Observer(
        builder: (_) => Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromARGB(255, 255, 115, 0),
          ),
          child: DropdownButtonFormField<String>(
            value: viewModel.selectedInterval,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              labelText: StringResource.DSV_TIME_SELECT_LABEL,
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(35, allowFontScalingSelf: true),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              errorText: viewModel.selectedIntervalError ? StringResource.FORM_FIELD_ERROR_TEXT : null,
              errorStyle: TextStyle(
                color: Colors.black,
              ),
              errorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              focusedErrorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            ),
            onChanged: (String newValue) {
              viewModel.selectedInterval = newValue;
              viewModel.selectedIntervalError = false;
            },
            items: viewModel.intervalList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
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
          if (viewModel.validate()) {
            onOfferClaimed();
          }
        },
      ),
    );
  }
}
