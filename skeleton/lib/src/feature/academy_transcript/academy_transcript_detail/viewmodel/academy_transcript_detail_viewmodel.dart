import 'package:flutter/cupertino.dart';
import 'package:skeleton/src/model/subject_result.dart';

class AcademyTranscriptDetailViewModel extends ChangeNotifier {
  List<SubjectResult>? _subjectResults;

  List<SubjectResult>? get subjectResults => _subjectResults;

  fetchData(int academyTranscriptId) async {
    List<SubjectResult> subjectResults =
        await _fetchSubjectResults(academyTranscriptId);
    notifyListeners();
  }

  _fetchSubjectResults(int academyTranscriptId) async {
    List<SubjectResult> result = [];
    result.add(SubjectResult(
        academy_transcript_id: 1,
        subject_code: "ARH241",
        subject_name: "Cơ sở tạo hình kiến trúc",
        credit_number: 3,
        test_1: 0,
        test_2: 8.5,
        exam: 8,
        final_result: 3.5));
    result.add(SubjectResult(
        academy_transcript_id: 1,
        subject_code: "NDF108",
        subject_name: "Quốc phòng, an ninh 1",
        credit_number: 0,
        test_1: 0,
        test_2: 9,
        exam: 7,
        final_result: 3.5));
    result.add(SubjectResult(
        academy_transcript_id: 1,
        subject_code: "ART105",
        subject_name: "Hình học hoạ hình",
        credit_number: 3,
        test_1: 0,
        test_2: 10,
        exam: 8,
        final_result: 4));
    result.add(SubjectResult(
        academy_transcript_id: 1,
        subject_code: "ART105",
        subject_name: "Nhập môn công nghệ thông tin",
        credit_number: 3,
        test_1: 0,
        test_2: 8,
        exam: 6.5,
        final_result: 3));
    result.add(SubjectResult(
        academy_transcript_id: 1,
        subject_code: "ARH118",
        subject_name: "Kiến trúc nhập môn",
        credit_number: 3,
        test_1: 0,
        test_2: 8,
        exam: 8.5,
        final_result: 3.5));
    result.add(SubjectResult(
        academy_transcript_id: 2,
        subject_code: "ENC101",
        subject_name: "Tiếng Anh 1",
        credit_number: 3,
        test_1: 0,
        test_2: 8.5,
        exam: 7.5,
        final_result: 3.5));
    result.add(SubjectResult(
        academy_transcript_id: 1,
        subject_code: "NDF109",
        subject_name: "Quốc phòng, an ninh 2",
        credit_number: 0,
        test_1: 0,
        test_2: 7,
        exam: 7,
        final_result: 3));
    result.add(SubjectResult(
        academy_transcript_id: 2,
        subject_code: "PHT307",
        subject_name: "Bóng rổ 1",
        credit_number: 2,
        test_1: 0,
        test_2: 0,
        exam: 6,
        final_result: 2));
    result.add(SubjectResult(
        academy_transcript_id: 2,
        subject_code: "SHL",
        subject_name: "Sinh hoạt lớp",
        credit_number: 0,
        test_1: 0,
        test_2: 0,
        exam: 0,
        final_result: 0));
    result.add(SubjectResult(
        academy_transcript_id: 2,
        subject_code: "ENC102",
        subject_name: "Tiếng Anh 2",
        credit_number: 3,
        test_1: 0,
        test_2: 8,
        exam: 6.5,
        final_result: 3));
    result.add(SubjectResult(
        academy_transcript_id: 2,
        subject_code: "NDF210",
        subject_name: "Quốc phòng, an ninh 3",
        credit_number: 0,
        test_1: 0,
        test_2: 8,
        exam: 9,
        final_result: 4));
    result.add(SubjectResult(
        academy_transcript_id: 2,
        subject_code: "MAT106",
        subject_name: "Đại số tuyến tính và Giải tích",
        credit_number: 3,
        test_1: 0,
        test_2: 7,
        exam: 5,
        final_result: 2));
    result.add(SubjectResult(
        academy_transcript_id: 2,
        subject_code: "CAP222",
        subject_name: "Tin học chuyên ngành kiến trúc, mỹ thuật 1",
        credit_number: 3,
        test_1: 0,
        test_2: 7,
        exam: 6,
        final_result: 2.5));
    result.add(SubjectResult(
        academy_transcript_id: 2,
        subject_code: "ARH245",
        subject_name: "Ký họa kiến trúc",
        credit_number: 3,
        test_1: 0,
        test_2: 7.5,
        exam: 8.5,
        final_result: 3.5));
    result.add(SubjectResult(
        academy_transcript_id: 2,
        subject_code: "ART120",
        subject_name: "Vẽ phối cảnh",
        credit_number: 3,
        test_1: 0,
        test_2: 9.5,
        exam: 8,
        final_result: 4));
    result.removeWhere(
        (element) => element.academy_transcript_id != academyTranscriptId);
    _subjectResults = result;
  }
}
