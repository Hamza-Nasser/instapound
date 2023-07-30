import 'package:flutter/material.dart';
import 'package:instapound/src/core/utils/app_colors.dart';

ThemeData appDarkTheme() {
  return ThemeData(
    // primarySwatch: AppColors.primary,
    primaryColor: AppColors.primaryDark,
    // textTheme: const TextTheme(),

    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: _inputDecorationTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        // foregroundColor: Colors.black,
        minimumSize: const Size(60, 45),
        backgroundColor: AppColors.primaryAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  fillColor: AppColors.formFieldFillColorDark,
  filled: true,
  contentPadding: const EdgeInsets.only(
    left: 10,
  ),
  // hintStyle: const TextStyle(
  //   color: AppColors.formFieldHintTextColor,
  //   fontSize: 14,
  //   fontFamily: 'Inter',
  //   fontWeight: FontWeight.w400,
  // ),
  // labelStyle: const TextStyle(
  //   color: AppColors.formFieldTextColor,
  // ),
  border: OutlineInputBorder(
    borderSide:
        const BorderSide(color: AppColors.formFieldBorderColor, width: 0.25),
    borderRadius: BorderRadius.circular(4),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
        const BorderSide(color: AppColors.formFieldBorderColor, width: 0.25),
    borderRadius: BorderRadius.circular(4),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        const BorderSide(color: AppColors.formFieldBorderColor, width: 0.25),
    borderRadius: BorderRadius.circular(4),
  ),
  errorBorder: OutlineInputBorder(
    borderSide:
        const BorderSide(color: AppColors.formFieldBorderColor, width: 0.25),
    borderRadius: BorderRadius.circular(4),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide:
        const BorderSide(color: AppColors.formFieldBorderColor, width: 0.25),
    borderRadius: BorderRadius.circular(4),
  ),
);
