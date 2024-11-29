import 'package:blog_app_task/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextTheme textTheme() {
  return TextTheme(
    titleSmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    displayLarge: TextStyle(
      fontSize: 16.sp,
    ),
    displayMedium: TextStyle(
      fontSize: 14.sp,
    ),
    displaySmall: TextStyle(fontSize: 12.sp),
    labelLarge: TextStyle(
        fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.grey),
    labelMedium: TextStyle(
        fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.grey),
    labelSmall: TextStyle(
        fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.grey),
  );
}
