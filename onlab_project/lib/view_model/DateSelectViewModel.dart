import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:table_calendar/table_calendar.dart';

part 'DateSelectViewModel.g.dart';

class DateSelectViewModel = _DateSelectViewModel with _$DateSelectViewModel;

abstract class _DateSelectViewModel with Store {
  @observable
  DateTime selectedDate = DateTime.now();

  CalendarController calendarController = CalendarController();
  final DaysOfWeekStyle daysOfWeekStyle = DaysOfWeekStyle(
    dowTextBuilder: (date, _) {
      switch (date.weekday) {
        case 1:
          return "H";
        case 2:
          return "K";
        case 3:
          return "Sz";
        case 4:
          return "Cs";
        case 5:
          return "P";
        case 6:
          return "Sz";
        default:
          return "V";
      }
    },
    weekdayStyle: TextStyle(color: Colors.black),
    weekendStyle: TextStyle(color: Colors.black),
  );
  final HeaderStyle headerStyle = HeaderStyle(
    titleTextBuilder: (date, _) {
      String month;
      switch (date.month) {
        case 1:
          month = "Január";
          break;
        case 2:
          month = "Február";
          break;
        case 3:
          month = "Március";
          break;
        case 4:
          month = "Április";
          break;
        case 5:
          month = "Május";
          break;
        case 6:
          month = "Június";
          break;
        case 7:
          month = "Július";
          break;
        case 8:
          month = "Augusztus";
          break;
        case 9:
          month = "Szeptember";
          break;
        case 10:
          month = "Október";
          break;
        case 11:
          month = "November";
          break;
        default:
          month = "December";
          break;
      }

      return date.year.toString() + " " + month;
    },
  );

  @observable
  String selectedInterval;

  @observable
  bool selectedIntervalError = false;

  bool validate() {
    if(selectedInterval == null) {
      selectedIntervalError = true;
    }

    return !selectedIntervalError;
  }

  final List<String> intervalList = [
    StringResource.DV_DAY_INTERVAL_AM_8_12,
    StringResource.DV_DAY_INTERVAL_PM_13_17,
  ];
}