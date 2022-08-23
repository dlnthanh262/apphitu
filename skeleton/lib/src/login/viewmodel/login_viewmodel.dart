import 'package:flutter/material.dart';
import 'package:skeleton/src/model/request_user_login.dart';

class LoginViewModel extends ChangeNotifier {
  bool isRequestingLogin = false;
  bool isShowPassword = false;

  enableShowPassword({required bool enable}){
    isShowPassword = enable;
    notifyListeners();
  }
  loading() {
    isRequestingLogin = true;
    notifyListeners();
  }

  Future<bool> requestLogin({required RequestUserLogin userLogin}) async {
    loading();
    if(userLogin.isValid()) {
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    }else{
      throw "Nhập đủ thông tin đăng nhập";
    }
  }
}
