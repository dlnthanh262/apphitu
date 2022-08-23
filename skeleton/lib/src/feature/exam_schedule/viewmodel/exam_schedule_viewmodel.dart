import 'package:flutter/cupertino.dart';

import '../../../model/exam_schedule.dart';

class ExamScheduleViewModel extends ChangeNotifier {
  List<ExamSchedule>? _examSchedule;

  List<ExamSchedule>? get examSchedule => _examSchedule;

  fetchData() async {
    await _fetchExamSchedules();
    notifyListeners();
  }

  _fetchExamSchedules() async {
    List<ExamSchedule> result = [];
    result.add(ExamSchedule(
        room_code: "bpyyhs7",
        room_name: "Phòng thi trực tuyến",
        method: "TN + Tự luận",
        subject_name: "Nhập môn công nghệ thông tin",
        subject_code: "CAP211",
        time: "60 phút",
        exam_group: "155",
        start_time: "09:45",
        exam_date: "20/01/2022",
        exam_day: "Thứ 5",
        semester: 2,
        year: 2021));
    _examSchedule = result;
  }
}
