import 'package:blog_app_task/core/theme/theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      textTheme: textTheme(),
      filledButtonTheme: filledButtonThemeData(),
      appBarTheme: appBarTheme());
}
