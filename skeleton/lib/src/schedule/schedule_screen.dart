import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:skeleton/src/model/schedule.dart';
import 'package:skeleton/src/schedule/schedule_detail/schedule_detail_screen.dart';
import 'package:skeleton/src/schedule/viewmodel/schedule_viewmodel.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import '../themes/colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScheduleState();
}

class _ScheduleState extends State<ScheduleScreen> {
  late ScheduleViewModel _scheduleViewModel;
  DateTime searchStartDate = DateTime.now();
  DateTime searchEndDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late final ValueNotifier<List<Schedule>> _selectedSchedules;
  LinkedHashMap<DateTime, List<Schedule>> kSchedules =
      LinkedHashMap<DateTime, List<Schedule>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  @override
  void initState() {
    _scheduleViewModel = ScheduleViewModel();
    _scheduleViewModel.fetchData();
    _selectedDay = _focusedDay;
    _selectedSchedules = ValueNotifier(_getSchedulesForDay(_selectedDay!));
    kSchedules.addAll(generateKScheduleSource());
    super.initState();
  }

  @override
  void dispose() {
    _selectedSchedules.dispose();
    super.dispose();
  }

  List<Schedule> _getSchedulesForDay(DateTime day) {
    return kSchedules[day] ?? [];
  }

  List<Schedule> _getSchedulesForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getSchedulesForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedSchedules.value = _getSchedulesForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedSchedules.value = _getSchedulesForRange(start, end);
    } else if (start != null) {
      _selectedSchedules.value = _getSchedulesForDay(start);
    } else if (end != null) {
      _selectedSchedules.value = _getSchedulesForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: MGColors.kMainColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Thời khoá biểu",
            style: Theme.of(context).textTheme.textStyle18,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: buildDayTab(),
      ),
    );
  }

  Widget buildDayTab() {
    initializeDateFormatting();
    return Column(
      children: [
        TableCalendar<Schedule>(
          locale: "vi",
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          calendarFormat: _calendarFormat,
          rangeSelectionMode: _rangeSelectionMode,
          eventLoader: _getSchedulesForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: const CalendarStyle(
            outsideDaysVisible: false,
            markerDecoration:
                BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            selectedDecoration:
                BoxDecoration(color: Color(0xFFBBDDFF), shape: BoxShape.circle),
            selectedTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          onDaySelected: _onDaySelected,
          onRangeSelected: _onRangeSelected,
          availableCalendarFormats: const {
            CalendarFormat.month: 'Tuần',
            CalendarFormat.twoWeeks: 'Tháng',
            CalendarFormat.week: '2 Tuần'
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        Divider(
          color: MGColors.grey,
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Schedule>>(
            valueListenable: _selectedSchedules,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ScheduleDetailScreen(
                                          schedule: value[index])))
                            },
                            leading: Column(
                              children: [
                                Text('Tiết',
                                    style: Theme.of(context)
                                        .textTheme
                                        .textStyle16SemiBold),
                                Text(
                                    '${value[index].from_lession}-${value[index].from_lession + value[index].lession_number}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .textStyle16SemiBold)
                              ],
                            ),
                            title: Text(
                              '${value[index].subject_code} - ${value[index].subject_name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .textStyle16SemiBold,
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Phòng: ${value[index].room_code}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .textStyle15,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.class_outlined,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('Lớp: ${value[index].class_code}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .textStyle15)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Divider(
                            color: MGColors.grey,
                          ),
                        ]),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
