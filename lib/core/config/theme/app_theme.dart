import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_color.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.background,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xff2C2B2B),
      hintStyle: TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w400,
      ),
      contentPadding: EdgeInsets.all(8.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        )
      )
    )
  );
}
