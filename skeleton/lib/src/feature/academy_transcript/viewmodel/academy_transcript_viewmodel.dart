import 'package:flutter/cupertino.dart';
import 'package:skeleton/src/model/academy_transcript.dart';

class AcademyTranscriptViewModel extends ChangeNotifier {
  List<AcademyTranscript>? _academyTranscripts;

  List<AcademyTranscript>? get academyTranscripts => _academyTranscripts;

  fetchData() async {
    await _fetchAcademyTranscripts();
    notifyListeners();
  }

  _fetchAcademyTranscripts() async {
    List<AcademyTranscript> result = [];
    result.add(AcademyTranscript(
        id: 1,
        student_id: "21822100670",
        average: 3,
        total_average: 3.25,
        credit_number: 15,
        total_credit_number: 30,
        semester: 2,
        year: 2021));
    result.add(AcademyTranscript(
        id: 2,
        student_id: "21822100670",
        average: 3.5,
        total_average: 3.5,
        credit_number: 15,
        total_credit_number: 15,
        semester: 1,
        year: 2021));
    _academyTranscripts = result;
  }
}
