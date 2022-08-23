import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class NoticeViewModel extends ChangeNotifier {
  String imagePath = "";
  String title = "";
  String userTarget = "";
  String description = "";

  attachImage() async {
    await pickImage();
    notifyListeners();
  }

  pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imagePath = pickedFile.path;
        return pickedFile.path;
      }
      return null;
    } catch (err) {
      imagePath = "";
    } finally {}
  }
}
