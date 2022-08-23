import 'dart:io';

import 'package:flutter/material.dart';

class ScreenUtils {
  static double _width = 0.0;
  static double _height = 0.0;

  static getWidth(BuildContext context) {
    if (_width == 0) {
      return fullWidth(context);
    }
    return _width;
  }

  static getHeight(BuildContext context) {
    if (_height == 0) {
      return fullHeight(context);
    }
    return _height;
  }

  static double fullWidth(BuildContext context) {
    final result = MediaQuery.of(context).size.width;
    _width = result;
    return result;
  }

  static double fullHeight(BuildContext context) {
    final result = MediaQuery.of(context).size.height;
    _height = result;
    return result;
  }

  static double heightOfStatusBar(BuildContext context) {
    final result = MediaQuery.of(context).padding.top;
    return result;
  }

  static double heightOfBottomNavigationBar(BuildContext context) =>
      isIphoneX(context) ? 58 : 56;

  static double heightOfNotch(BuildContext context) {
    if (isIphoneX(context)) {
      return 34;
    } else {
      return MediaQuery.of(context).padding.bottom;
    }
  }

  static bool isIphone11(BuildContext context) {
    final bool iPhoneX = MediaQuery.of(context).size.height > 812.0;
    if (Platform.isIOS && iPhoneX) {
      return true;
    } else {
      return false;
    }
  }

  static bool isIphoneX(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    print("KKKK>>>>isIphoneX-height: $height");
    final bool iPhoneX = height == 812.0;
    if (Platform.isIOS && iPhoneX) {
      return true;
    } else {
      return false;
    }
  }

  static double getHeightOfMiniPlayer(BuildContext context) {
    // if (isIphoneX(context)) {
    //   return 93;
    // }

    return 105;
  }
}
