import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/model/schedule.dart';
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

  @override
  void initState() {
    _scheduleViewModel = ScheduleViewModel();
    _scheduleViewModel.fetchData();
    _selectedDay = _focusedDay;
    _selectedSchedules = ValueNotifier(_getSchedulesForDay(_selectedDay!));
    super.initState();
  }

  @override
  void dispose() {
    _selectedSchedules.dispose();
    super.dispose();
  }

  List<Schedule> _getSchedulesForDay(DateTime day) {
    // Implementation example
    return kSchedules[day] ?? [];
  }

  List<Schedule> _getSchedulesForRange(DateTime start, DateTime end) {
    // Implementation example
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
        _rangeStart = null; // Important to clean those
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

    // `start` or `end` could be null
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
          bottom: TabBar(
            isScrollable: true,
            onTap: (index) {},
            tabs: [
              Tab(
                child: Text("Ngày",
                    style: Theme.of(context).textTheme.textStyle16),
              ),
              Tab(
                child: Text("Tuần",
                    style: Theme.of(context).textTheme.textStyle16),
              ),
            ],
          ),
          title: Text(
            "Thời khoá biểu",
            style: Theme.of(context).textTheme.textStyle18,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: TabBarView(
          children: [buildDayTab(), buildWeekTab()],
        ),
      ),
    );
  }

  Widget buildDayTab() {
    initializeDateFormatting();
    return Column(
      children: [
        TableCalendar<Schedule>(
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
          calendarStyle: CalendarStyle(
            // Use `CalendarStyle` to customize the UI
            outsideDaysVisible: false,
          ),
          onDaySelected: _onDaySelected,
          onRangeSelected: _onRangeSelected,
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
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(children: [
                      Text('${value[index].day}'),
                      ListTile(
                        onTap: () => {},
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
                          style:
                              Theme.of(context).textTheme.textStyle16SemiBold,
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text('Phòng: ${value[index].room_code}')
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.class_outlined),
                                Text('Lớp: ${value[index].class_code}')
                              ],
                            )
                          ],
                        ),
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

  Widget buildWeekTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
            // Enable week numbers (disabled by default).
          ),
        ],
      ),
    );
  }
}
