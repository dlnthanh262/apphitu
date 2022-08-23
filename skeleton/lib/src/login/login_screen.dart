import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/login/viewmodel/login_viewmodel.dart';
import 'package:skeleton/src/menu/menu_screen.dart';
import 'package:skeleton/src/model/request_user_login.dart';
import 'package:skeleton/src/themes/app_icons.dart';
import 'package:skeleton/src/themes/colors.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginViewModel _loginViewModel;
  late TextEditingController _userNameEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    _loginViewModel = LoginViewModel();
    _userNameEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ChangeNotifierProvider.value(
        value: _loginViewModel,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  AppIcons.getImagePath("image_background.jpg"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TÀI KHOẢN",
                      style: Theme.of(context)
                          .textTheme
                          .textStyle14
                          .copyWith(color: MGColors.black),
                    ),
                    TextField(
                      controller: _userNameEditingController,
                      style: Theme.of(context)
                          .textTheme
                          .textStyle12
                          .copyWith(color: MGColors.black),
                      decoration: InputDecoration(
                          hintText: "Mã sinh viên hoặc CB GV-NV",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .textStyle12
                              .copyWith(color: MGColors.grey)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MẬT KHẨU",
                      style: Theme.of(context).textTheme.textStyle14,
                    ),
                    Selector<LoginViewModel, bool>(
                        selector: (_, viewModel) =>
                        viewModel.isShowPassword,
                        builder: (context, isEnable, _) {
                        return TextField(
                          obscureText: !isEnable,
                          style: Theme.of(context)
                              .textTheme
                              .textStyle12
                              .copyWith(color: MGColors.black),
                          controller: _passwordEditingController,
                          decoration: InputDecoration(
                            hintText: "Mật khẩu",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .textStyle12
                                .copyWith(color: MGColors.grey),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _loginViewModel.enableShowPassword(
                                      enable: !_loginViewModel.isShowPassword);
                                },
                                child: Icon(isEnable
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                        );
                      }
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      primary: MGColors.kMainColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                    onPressed: () async {
                      await _loginViewModel
                          .requestLogin(
                              userLogin: RequestUserLogin(
                                  userName: _userNameEditingController.text
                                      .toString(),
                                  password: _passwordEditingController.text
                                      .toString()))
                          .then((value) {
                        if (value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MenuScreen()));
                        }
                      }).catchError((e) {
                        Fluttertoast.showToast(
                            msg: e,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });
                    },
                    child: Text(
                      "Đăng nhập",
                      style: Theme.of(context).textTheme.textStyle18.copyWith(
                          color: MGColors.white, fontWeight: FontWeight.bold),
                    )),
              ),
              TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                        text: "Đăng nhập không được?",
                        style: Theme.of(context)
                            .textTheme
                            .textStyle12
                            .copyWith(color: MGColors.black),
                        children: [
                          TextSpan(
                            text: "Xem hướng dẫn ở đây ",
                            style: Theme.of(context)
                                .textTheme
                                .textStyle12
                                .copyWith(color: MGColors.kMainColor),
                          )
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
