import 'package:flutter/cupertino.dart';
import 'package:skeleton/src/model/new.dart';

class HomeViewModel extends ChangeNotifier {
  News? _hotNew;

  News? get hotNew => _hotNew;

  List<News>? _newsSchool;

  List<News> get newsSchool => _newsSchool ?? [];

  List<News>? _newsStudent;

  List<News> get newsStudent => _newsStudent ?? [];

  fetchData() async {
    await _fetchNewsSchool();
    await _fetchNewsStudent();
    _hotNew = _newsSchool!.last;
    notifyListeners();
  }

  _fetchNewsSchool() async {
    List<News> result = [];
    result.add(News(
      title: "Hướng dẫn làm thủ tục nhập học Khoá 2022 (K46)",
      urlThumbnail:
      "https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.18169-9/20228908_1766689753345473_5279922829826840039_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=-idMxXWFnL4AX_bNayp&_nc_ht=scontent.fsgn5-9.fna&oh=00_AT812Mw5ltSkgyzw7JN_srXUpQ6tDjo0GyRyDg8w5kJc6A&oe=62F5063A",
    ));
    result.add(News(
      title:
      "TRƯỜNG CAO ĐẲNG CÔNG THƯƠNG TPHCM CÔNG BỐ ĐIỂM TRÚNG TUYỂN HỌC BẠ THPT ĐỢT 1 NĂM 2022",
      urlThumbnail:
      "https://cdn.tuoitre.vn/2020/4/27/photo-1-15879753186811463055656.jpg",
    ));
    result.add(News(
      title:
      "THÔNG BÁO TUYỂN SINH CHƯƠNG TRÌNH CAO ĐẲNG CHẤT LƯỢNG CAO NĂM 2022",
      urlThumbnail:
      "https://cdn.tuoitre.vn/2020/4/27/photo-2-15879753228781709503953.jpg",
    ));
    result.add(News(
      title: "Vào HITU – Gạt nỗi lo tăng học phí",
      urlThumbnail:
      "https://cdn.tuoitre.vn/2020/4/27/photo-1-15879753228721290925109.jpg",
    ));
    result.add(News(
      title:
      "Phụ huynh, thí sinh xác nhận nhập học sớm tại HITU để chắc chân có một bến đỗ an toàn",
      urlThumbnail:
      "https://icdn.dantri.com.vn/thumb_w/640/2020/07/01/screen-shot-20200701-at-81509-am-1593566215740.png",
    ));
    _newsSchool = result;
    _newsSchool?.shuffle();
  }

  _fetchNewsStudent() async {
    List<News> result = [];
    result.add(News(
      title: "Hướng dẫn làm thủ tục nhập học Khoá 2022 (K46)",
      urlThumbnail:
          "https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.18169-9/20228908_1766689753345473_5279922829826840039_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=-idMxXWFnL4AX_bNayp&_nc_ht=scontent.fsgn5-9.fna&oh=00_AT812Mw5ltSkgyzw7JN_srXUpQ6tDjo0GyRyDg8w5kJc6A&oe=62F5063A",
    ));
    result.add(News(
      title:
          "TRƯỜNG CAO ĐẲNG CÔNG THƯƠNG TPHCM CÔNG BỐ ĐIỂM TRÚNG TUYỂN HỌC BẠ THPT ĐỢT 1 NĂM 2022",
      urlThumbnail:
          "https://cdn.tuoitre.vn/2020/4/27/photo-1-15879753186811463055656.jpg",
    ));
    result.add(News(
      title:
          "THÔNG BÁO TUYỂN SINH CHƯƠNG TRÌNH CAO ĐẲNG CHẤT LƯỢNG CAO NĂM 2022",
      urlThumbnail:
          "https://cdn.tuoitre.vn/2020/4/27/photo-2-15879753228781709503953.jpg",
    ));
    result.add(News(
      title: "Vào HITU – Gạt nỗi lo tăng học phí",
      urlThumbnail:
          "https://cdn.tuoitre.vn/2020/4/27/photo-1-15879753228721290925109.jpg",
    ));
    result.add(News(
      title:
          "Phụ huynh, thí sinh xác nhận nhập học sớm tại HITU để chắc chân có một bến đỗ an toàn",
      urlThumbnail:
          "https://icdn.dantri.com.vn/thumb_w/640/2020/07/01/screen-shot-20200701-at-81509-am-1593566215740.png",
    ));
    _newsStudent = result;
    _newsStudent?.shuffle();
  }
}
