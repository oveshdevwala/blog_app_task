import 'package:blog_app_task/core/theme/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

FilledButtonThemeData filledButtonThemeData() {
  return FilledButtonThemeData(
      style: FilledButton.styleFrom(
          backgroundColor: AppColors.black,
          padding: const EdgeInsets.all(4),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: const Radius.circular(12).r,
                  topLeft: Radius.circular(12.r)))));
}
