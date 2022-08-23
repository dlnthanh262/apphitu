import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:skeleton/src/model/schedule.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleViewModel extends ChangeNotifier {

  List<Schedule>? _schedule;

  List<Schedule> get schedule => _schedule ?? [];

  fetchData() async {
    await _fetchSchedule();
    notifyListeners();
  }

  _fetchSchedule() async {
    List<Schedule> result = [];
    result.add(Schedule(
        room_code: "B-15.01",
        room_name: "Phòng lý thuyết",
        subject_code: "NDF211",
        subject_name: "Quốc phòng, an ninh 4",
        class_code: "21QP4_04",
        from_lession: 7,
        lession_number: 4,
        start_date: "01/08/2022",
        end_date: "01/09/2022",
        day: "Thứ 2",
        semester: 3,
        year: 2021,
        teacher_code: "SVA0140972",
        teacher_name: "Vũ Anh Sơn",
        credit_number: 5,
        study_group: "01"
    ));
    result.add(Schedule(
        room_code: "A-08.11",
        room_name: "Phòng lý thuyết",
        subject_code: "ARH242",
        subject_name: "Sáng tác kiến trúc",
        class_code: "21DKIA2",
        from_lession: 1,
        lession_number: 5,
        start_date: "01/08/2022",
        end_date: "01/01/2023",
        day: "Thứ 2",
        semester: 1,
        year: 2022,
        teacher_code: "NPNH290372",
        teacher_name: "Phan Nguyễn Hoàng Nguyên",
        credit_number: 3,
        study_group: "01"
    ));
    result.add(Schedule(
        room_code: "A-08.02/2",
        room_name: "PHONG MAY LAU 8",
        subject_code: "CAP223",
        subject_name: "Tin học chuyên ngành kiến trúc, mỹ thuật 2",
        class_code: "21DKIA2",
        from_lession: 7,
        lession_number: 4,
        start_date: "01/08/2022",
        end_date: "01/01/2023",
        day: "Thứ 3",
        semester: 1,
        year: 2022,
        teacher_code: "NPNH290372",
        teacher_name: "Phan Nguyễn Hoàng Nguyên",
        credit_number: 3,
        study_group: "05"
    ));
    result.add(Schedule(
        room_code: "A-04.10",
        room_name: "A-04.10",
        subject_code: "ARH121",
        subject_name: "Nguyên lý thiết kế kiến trúc nhà ở",
        class_code: "21DKIA2",
        from_lession: 4,
        lession_number: 2,
        start_date: "01/08/2022",
        end_date: "01/01/2023",
        day: "Thứ 5",
        semester: 1,
        year: 2022,
        teacher_code: "TNQ0191271",
        teacher_name: "Nguyễn Quốc Trung",
        credit_number: 3,
        study_group: "02"
    ));
    result.add(Schedule(
        room_code: "A-08.02/2",
        room_name: "PHONG MAY LAU 8",
        subject_code: "CAP223",
        subject_name: "Tin học chuyên ngành kiến trúc, mỹ thuật 2",
        class_code: "21DKIA2",
        from_lession: 7,
        lession_number: 4,
        start_date: "01/08/2022",
        end_date: "01/01/2023",
        day: "Thứ 6",
        semester: 1,
        year: 2022,
        teacher_code: "NPNH290372",
        teacher_name: "Phan Nguyễn Hoàng Nguyên",
        credit_number: 3,
        study_group: "05"
    ));
    _schedule = result;
    _schedule?.shuffle();
  }
}

final List<Schedule> schedule = [
  Schedule(
      room_code: "B-15.01",
      room_name: "Phòng lý thuyết",
      subject_code: "NDF211",
      subject_name: "Quốc phòng, an ninh 4",
      class_code: "21QP4_04",
      from_lession: 7,
      lession_number: 4,
      start_date: "01/08/2022",
      end_date: "01/09/2022",
      day: "Thứ 2",
      semester: 3,
      year: 2021,
      teacher_code: "SVA0140972",
      teacher_name: "Vũ Anh Sơn",
      credit_number: 5,
      study_group: "01"
  ),
  Schedule(
      room_code: "A-08.11",
      room_name: "Phòng lý thuyết",
      subject_code: "ARH242",
      subject_name: "Sáng tác kiến trúc",
      class_code: "21DKIA2",
      from_lession: 1,
      lession_number: 5,
      start_date: "01/08/2022",
      end_date: "01/01/2023",
      day: "Thứ 2",
      semester: 1,
      year: 2022,
      teacher_code: "NPNH290372",
      teacher_name: "Phan Nguyễn Hoàng Nguyên",
      credit_number: 3,
      study_group: "01"
  ),
  Schedule(
      room_code: "A-08.02/2",
      room_name: "PHONG MAY LAU 8",
      subject_code: "CAP223",
      subject_name: "Tin học chuyên ngành kiến trúc, mỹ thuật 2",
      class_code: "21DKIA2",
      from_lession: 7,
      lession_number: 4,
      start_date: "01/08/2022",
      end_date: "01/01/2023",
      day: "Thứ 3",
      semester: 1,
      year: 2022,
      teacher_code: "NPNH290372",
      teacher_name: "Phan Nguyễn Hoàng Nguyên",
      credit_number: 3,
      study_group: "05"
  ),
  Schedule(
      room_code: "A-08.02/2",
      room_name: "PHONG MAY LAU 8",
      subject_code: "CAP223",
      subject_name: "Tin học chuyên ngành kiến trúc, mỹ thuật 2",
      class_code: "21DKIA2",
      from_lession: 7,
      lession_number: 4,
      start_date: "01/08/2022",
      end_date: "01/01/2023",
      day: "Thứ 3",
      semester: 1,
      year: 2022,
      teacher_code: "NPNH290372",
      teacher_name: "Phan Nguyễn Hoàng Nguyên",
      credit_number: 3,
      study_group: "05"
  )
];
final kSchedules = LinkedHashMap<DateTime, List<Schedule>>(
  equals: isSameDay,
  hashCode: getHashCode,
)
  ..addAll(_kScheduleSource);

final _kScheduleSource = { for (var item in List.generate(50, (index) => index)) DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5) : List.generate(
            item % 4 + 1, (index) => Schedule(
            room_code: "A-08.02/2",
            room_name: "PHONG MAY LAU 8",
            subject_code: "CAP223",
            subject_name: "Môn học ${index}",
            class_code: "21DKIA2",
            from_lession: 7,
            lession_number: 4,
            start_date: "01/08/2022",
            end_date: "01/01/2023",
            day: "Thứ 3",
            semester: 1,
            year: 2022,
            teacher_code: "NPNH290372",
            teacher_name: "Phan Nguyễn Hoàng Nguyên",
            credit_number: 3,
            study_group: "05"
        )) }
  ..addAll({
    kToday: [
      Schedule(
          room_code: "A-08.02/2",
          room_name: "PHONG MAY LAU 8",
          subject_code: "CAP223",
          subject_name: "Môn học 1",
          class_code: "21DKIA2",
          from_lession: 7,
          lession_number: 4,
          start_date: "01/08/2022",
          end_date: "01/01/2023",
          day: "Thứ 3",
          semester: 1,
          year: 2022,
          teacher_code: "NPNH290372",
          teacher_name: "Phan Nguyễn Hoàng Nguyên",
          credit_number: 3,
          study_group: "05"
      )
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last
      .difference(first)
      .inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);