import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/feature/profile/password/password_screen.dart';
import 'package:skeleton/src/feature/profile/viewmodel/profile_viewmodel.dart';
import 'package:skeleton/src/themes/dashed_line.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

import '../../themes/colors.dart';
import 'email/email_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
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
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: MGColors.kMainColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Tài khoản HITU của bạn",
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
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: _profileViewModel.student!.avatar.isNotEmpty
                            ? Image.network(
                                _profileViewModel.student!.avatar,
                                height: 150.0,
                                width: 150.0,
                              )
                            : Container(
                                height: 150,
                                width: 150,
                                color: MGColors.lightGrey,
                              ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 55,
                          width: 40,
                          height: 40,
                          child: TextButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                              color: MGColors.grey,
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Text(
                    _profileViewModel.student!.name,
                    style: Theme.of(context).textTheme.textStyle16SemiBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(_profileViewModel.student!.id,
                        style: Theme.of(context).textTheme.textStyle15),
                    subtitle: Text('Tài khoản truy cập cổng thông tin HITU',
                        style: Theme.of(context).textTheme.textStyle12Grey),
                  ),
                ),
                DashedLine(
                  color: Color(0xFFAAAAAA),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  minLeadingWidth: 50,
                  title: Text(_profileViewModel.student!.email,
                      style: Theme.of(context).textTheme.textStyle15),
                  subtitle: Text('Email dùng để khôi phục mật khẩu và nhận các thông báo',
                      style: Theme.of(context).textTheme.textStyle12Grey),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: MGColors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => EmailScreen()));
                  },
                ),
                DashedLine(
                  color: Color(0xFFAAAAAA),
                ),
                SizedBox(height: 20,),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  minLeadingWidth: 50,
                  leading: Icon(Icons.lock, color: MGColors.kMainColor, size: 30,),
                  title: Text('Đổi mật khẩu',
                      style: Theme.of(context).textTheme.textStyle15),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: MGColors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PasswordScreen()));
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  minLeadingWidth: 50,
                  leading: Icon(Icons.exit_to_app, size: 30,),
                  title: Text('Đăng xuất tài khoản',
                      style: Theme.of(context).textTheme.textStyle15RedSemiBold),
                  onTap: () {},
                ),
                Divider(
                  color: Color(0xFFAAAAAA),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
