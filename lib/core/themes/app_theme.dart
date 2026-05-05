import 'package:e_wallet/core/themes/custom_themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: CustomTextTheme.lightTextTheme,
  scaffoldBackgroundColor: const Color(0xffF3F3F3)
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
   

   
  );
}