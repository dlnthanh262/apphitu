class SubjectResult {
  int academy_transcript_id;
  String subject_code;
  String subject_name;
  double test_1;
  double test_2;
  double exam;
  int credit_number;
  double final_result;

  SubjectResult(
      {this.academy_transcript_id = 0,
      this.subject_code = "",
      this.subject_name = "",
      this.test_1 = 0,
      this.test_2 = 0,
      this.exam = 0,
      this.final_result = 0,
      this.credit_number = 0});
}
