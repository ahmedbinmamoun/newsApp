import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.transparentColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      titleLarge: AppStyles.bold20Black,
      labelSmall: AppStyles.medium12Grey,
      labelMedium: AppStyles.medium14Black,
      headlineLarge: AppStyles.medium24Black,
      headlineMedium: AppStyles.medium20Black
    ),
  );


  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      surfaceTintColor: AppColors.transparentColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16White,
      labelSmall: AppStyles.medium12Grey,
      labelMedium: AppStyles.medium14White,
      headlineLarge: AppStyles.medium24White,
      headlineMedium: AppStyles.medium20White,
      titleLarge: AppStyles.bold20White,
    ),
  );
}