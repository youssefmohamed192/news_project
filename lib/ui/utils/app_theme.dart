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
        toolbarHeight: 68,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.description),
          bodyMedium: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.time),
          bodySmall: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: AppColors.title)));
}
