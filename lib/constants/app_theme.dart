import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: AppColors.myColorScheme,
    inputDecorationTheme: const InputDecorationTheme(
      prefixStyle:
          TextStyle(color: AppColors.primary), // Set the global icon color here
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor:
          AppColors.light, // Set your desired foregroundColor globally
    ),
    scaffoldBackgroundColor: AppColors.light,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(foregroundColor: AppColors.light),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          AppColors.light,
        ), //text (and icon)
      ),
    ),
   
    datePickerTheme: DatePickerThemeData(
      cancelButtonStyle: ButtonStyle(
          backgroundColor:
              WidgetStateColor.resolveWith((states) => AppColors.danger),
          foregroundColor:
              WidgetStateColor.resolveWith((states) => AppColors.light)),
      confirmButtonStyle: ButtonStyle(
          backgroundColor:
              WidgetStateColor.resolveWith((states) => AppColors.primary),
          foregroundColor:
              WidgetStateColor.resolveWith((states) => AppColors.light)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.light,

    // other properties
  );
}
