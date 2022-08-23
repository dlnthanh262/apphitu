import 'package:flutter/cupertino.dart';

class ClassViewModel extends ChangeNotifier {
  fetchData() async {
    await _fetchClass();
    notifyListeners();
  }

  _fetchClass() async {}
}
