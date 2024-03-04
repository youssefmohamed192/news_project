import 'package:flutter/material.dart';
import 'package:news_project/ui/utils/app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarTextStyle = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 22, color: AppColors.white);
  static const TextStyle tabBarTextStyle =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 14);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        titleTextStyle: appBarTextStyle,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)))),
  );
}
