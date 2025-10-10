import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.greyColor
    ),
    appBarTheme: const AppBarTheme(
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
    ), tabBarTheme: const TabBarThemeData(indicatorColor: AppColors.blackColor),
  );


  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
     progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.greyColor
    ),
    appBarTheme: const AppBarTheme(
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
    ), tabBarTheme: const TabBarThemeData(indicatorColor: AppColors.whiteColor),
  );
}