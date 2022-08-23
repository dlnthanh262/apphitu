class RequestUserLogin {
  String userName = "";
  String password = "";

  RequestUserLogin({required this.userName, required this.password});

  bool isValid() => userName.isNotEmpty && password.isNotEmpty;
}
