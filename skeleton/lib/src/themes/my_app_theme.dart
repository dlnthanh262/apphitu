import 'package:flutter/material.dart';

import 'colors.dart';

extension CustomTextTheme on TextTheme {
  TextStyle get textStyle16 {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: MGColors.kMainTextColor,
    );
  }

  TextStyle get textStyle14 {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: MGColors.kMainTextColor,
    );
  }

  TextStyle get textStyle18 {
    return TextStyle(
      fontSize: 18,
      color: MGColors.kMainTextColor,
    );
  }

  TextStyle get textStyle15 {
    return TextStyle(
        fontSize: 15,
        height: 1.4,
        fontWeight: FontWeight.w400,
        color: MGColors.kMainTextColor);
  }

  TextStyle get textStyle13 {
    return TextStyle(
        fontSize: 13,
        height: 1.4,
        fontWeight: FontWeight.w400,
        color: MGColors.kMainTextColor);
  }

  TextStyle get textStyle12 {
    return TextStyle(
        fontSize: 12,
        height: 1.4,
        fontWeight: FontWeight.w400,
        color: MGColors.kMainTextColor);
  }

  TextStyle get textStyle11 {
    return TextStyle(
      fontSize: 11,
      height: 1.4,
      color: MGColors.kMainTextColor,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get textStyle10 {
    return TextStyle(
      fontSize: 10,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
      color: MGColors.kMainTextColor,
    );
  }

  TextStyle get textStyle14Grey {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: MGColors.grey,
    );
  }

  TextStyle get textStyle12Grey {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: MGColors.grey,
    );
  }

  TextStyle get textStyle16SemiBold {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: MGColors.black,
    );
  }

  TextStyle get textStyle15RedSemiBold {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.red,
    );
  }
}
