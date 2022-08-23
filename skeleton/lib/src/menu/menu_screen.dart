import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton/src/feature/feature_screen.dart';
import 'package:skeleton/src/themes/app_icons.dart';
import 'package:skeleton/src/themes/colors.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

import '../feature/schedule/schedule_screen.dart';
import '../home/home_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<MenuScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ScheduleScreen(),
    Scaffold(
      backgroundColor: Colors.red,
    ),
    Scaffold(
      backgroundColor: Colors.yellow,
    ),
    FeatureScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: MGColors.kMainColor,
        selectedLabelStyle: Theme.of(context)
            .textTheme
            .textStyle12
            .copyWith(color: MGColors.kMainColor, fontWeight: FontWeight.w500),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.getIconPath("ic_home.svg"),
                height: 20,
                width: 20,
                color: MGColors.kMainColor,
              ),
              label: "Tin tức"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.getIconPath("ic_calendar.svg"),
                  height: 20, width: 20, color: MGColors.kMainColor),
              label: "Lịch học"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.getIconPath("ic_exam.svg"),
                  height: 20, width: 20, color: MGColors.kMainColor),
              label: "Lịch thi"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.getIconPath("ic_cs.svg"),
                  height: 20, width: 20, color: MGColors.kMainColor),
              label: "Hỗ trợ"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.getIconPath("ic_more.svg"),
                  height: 20, width: 20, color: MGColors.kMainColor),
              label: "Học tập")
        ],
      ),
    );
  }

  void _onItemTapped(int value) {
    if (_selectedIndex != value) {
      setState(() {
        _selectedIndex = value;
      });
    }
  }
}
