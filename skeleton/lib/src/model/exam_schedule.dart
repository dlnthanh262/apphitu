class ExamSchedule {
  String room_name = "";
  String room_code = "";
  String start_time = "";
  String subject_name = "";
  String method = "";
  String subject_code = "";
  String exam_group = "";
  String exam_date = "";
  String exam_day = "";
  String time = "";
  int semester = 1;
  int year = 2022;

  ExamSchedule(
      {this.room_code = "",
      this.room_name = "",
      this.subject_code = "",
      this.subject_name = "",
      this.start_time = "",
      this.method = "",
      this.exam_group = "",
      this.exam_date = "",
      this.exam_day = "",
      this.time = "",
      this.semester = 1,
      this.year = 2022});
}
