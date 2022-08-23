import 'package:flutter/material.dart';
import 'package:skeleton/src/login/login_screen.dart';
import 'package:skeleton/src/themes/colors.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
