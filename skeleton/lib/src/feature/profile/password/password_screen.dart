import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/feature/profile/viewmodel/profile_viewmodel.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

import '../../../themes/colors.dart';
import '../../../themes/screen_utils.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordState();
}

class _PasswordState extends State<PasswordScreen> {
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
            "Thay đổi mật khẩu",
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
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu cũ',
                  ),
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu mới',
                  ),
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Xác nhận lại mật khẩu',
                  ),
                ),
                Container(
                  width: ScreenUtils.getWidth(context),
                  color: MGColors.kMainColor,
                  margin: const EdgeInsets.only(top: 30.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text('LƯU MẬT KHẨU MỚI',
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
