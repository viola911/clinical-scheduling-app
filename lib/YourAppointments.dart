import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduling_app/Schedules.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class LoadMoreWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

Map<DateTime, List<_Meeting>> _dataCollection = <DateTime, List<_Meeting>>{};

class ScheduleExample<widget> extends State<LoadMoreWidget> {
  List<String> _subjectCollection = <String>[];
  List<Color> _colorCollection = <Color>[];
  MeetingDataSource _events = MeetingDataSource(<_Meeting>[]);

  @override
  void initState() {
    _addAppointment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Appointments"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SafeArea(
                    child: SfCalendar(
                  view: CalendarView.day,
                  allowedViews: [
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.month,
                    CalendarView.schedule,
                  ],
                  dataSource: _events,
                  loadMoreWidgetBuilder: loadMoreWidget,
                )),
              )
            ],
          ),
        ));
  }

  Widget loadMoreWidget(
      BuildContext context, LoadMoreCallback loadMoreAppointments) {
    return FutureBuilder<void>(
      initialData: 'loading',
      future: loadMoreAppointments(),
      builder: (context, snapShot) {
        return Container(
            alignment: Alignment.center, child: CircularProgressIndicator());
      },
    );
  }

  void _addAppointment() {
    _subjectCollection.add('Meeting');

    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF36B37B));
    _colorCollection.add(const Color(0xFF01A1EF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));
    _colorCollection.add(const Color(0xFF0A8043));

    _dataCollection = <DateTime, List<_Meeting>>{};
    final DateTime today = DateTime(2022, 05, 11);
    final DateTime rangeStartDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: -500));
    final DateTime rangeEndDate = DateTime(2023, 12, 31);
    DateTime date, startDate;
    _Meeting meeting;

    Random random = Random();
    for (DateTime i = rangeStartDate;
        i.isBefore(rangeEndDate);
        i = i.add(Duration(days: 1))) {
      date = i;
      for (int j = 0; j < 2; j++) {
        startDate =
            DateTime(date.year, date.month, date.day, 2 + (j * 5), 0, 0);
        meeting = _Meeting(
            _subjectCollection[0],
            startDate,
            startDate.add(Duration(hours: 1)),
            _colorCollection[random.nextInt(10)],
            false);

        if (_dataCollection.containsKey(selectedIndex)) {
          final List<_Meeting>? meetings = _dataCollection[date];
          meetings?.add(meeting);
          _dataCollection[date] = meetings!;
        } else {
          _dataCollection[date] = [meeting];
        }
      }
    }
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(this.source);

  List<_Meeting> source;

  @override
  List<dynamic> get appointments => source;

  @override
  DateTime getStartTime(int index) {
    return source[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].to;
  }

  @override
  bool isAllDay(int index) {
    return source[index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return source[index].eventName;
  }

  @override
  Color getColor(int index) {
    return source[index].background;
  }

  @override
  Future<void> handleLoadMore(DateTime startDate, DateTime endDate) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    List<_Meeting> meetings = <_Meeting>[];
    DateTime date = DateTime(startDate.year, startDate.month, startDate.day);
    DateTime appEndDate =
        DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);

    appointments.addAll(meetings);
    notifyListeners(CalendarDataSourceAction.add, meetings);
  }
}

class _Meeting {
  _Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
