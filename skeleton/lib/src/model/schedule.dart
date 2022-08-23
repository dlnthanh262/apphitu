class Schedule {
  String room_code = "";
  String room_name = "";
  String subject_code = "";
  String subject_name = "";
  String class_code = "";
  int from_lession = 1;
  int lession_number = 1;
  String start_date = "";
  String end_date = "";
  String day = "";
  int semester = 1;
  int year = 2022;
  String teacher_code = "";
  String teacher_name = "";
  String study_group = "";
  int credit_number = 1;

  Schedule(
      {this.room_code = "",
      this.room_name = "",
      this.subject_code = "",
      this.subject_name = "",
      this.class_code = "",
      this.from_lession = 1,
      this.lession_number = 1,
      this.start_date = "",
      this.end_date = "",
      this.day = "",
      this.semester = 1,
      this.year = 2022,
      this.teacher_code = "",
      this.teacher_name = "",
      this.study_group = "",
      this.credit_number = 1});
}
