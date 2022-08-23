import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/feature/profile/viewmodel/profile_viewmodel.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

import '../../../themes/colors.dart';
import '../../../themes/screen_utils.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmailState();
}

class _EmailState extends State<EmailScreen> {
  late ProfileViewModel _profileViewModel;

  @override
  void initState() {
    _profileViewModel = ProfileViewModel();
    _profileViewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _profileViewModel,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: MGColors.kMainColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Thay đổi email",
            style: Theme.of(context).textTheme.textStyle18,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Email sẽ sử dụng để lấy lại mật khẩu và nhận các thông báo mới nhất từ trường.',
                  style: Theme.of(context).textTheme.textStyle15,
                ),
                TextField(
                  controller: TextEditingController()
                    ..text = _profileViewModel.student!.email,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email của bạn',
                  ),
                ),
                Container(
                  width: ScreenUtils.getWidth(context),
                  color: MGColors.kMainColor,
                  margin: const EdgeInsets.only(top: 30.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text('LƯU EMAIL',
                          style: TextStyle(color: MGColors.white))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
