import 'package:e_wallet/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextTheme {
  static TextTheme lightTextTheme= TextTheme(
    // Headings - Extra Bold
    displayLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w800, // Extra Bold
      height: 1.5,
    ),
    displayMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w800,
      height: 1.5,
    ),
    displaySmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w800,
      height: 1.5,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w800,
      height: 1.5,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700, // Bold
      height: 1.5,
    ),

    // Body - Semibold
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600, // Semibold
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),

    // Labels - Medium
    labelLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500, // Medium
      height: 1.5,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: AppColors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),

    // Title - Regular
    titleLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400, // Regular
      height: 1.5,
    ),
    titleMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    titleSmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  );
}
