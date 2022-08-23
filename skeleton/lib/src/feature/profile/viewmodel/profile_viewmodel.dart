import 'package:flutter/cupertino.dart';
import '../../../model/student.dart';

class ProfileViewModel extends ChangeNotifier {
  Student? _student;

  Student? get student => _student;

  fetchData() async {
    await _fetchStudent();
    notifyListeners();
  }

  _fetchStudent() async {
    Student result = Student(
        id: "21822100670",
        name: "Phan Hồng Duy",
        email: "phanhongduy1@gmail.com",
        password: "Phduy23012003",
        avatar: "");
    _student = result;
  }
}
