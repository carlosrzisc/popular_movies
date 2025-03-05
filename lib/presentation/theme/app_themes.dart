import 'package:flutter/material.dart';
import 'package:popular_movies/presentation/theme/app_colors.dart';
import 'package:popular_movies/presentation/theme/app_styles.dart'
    show AppStyles;

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primary,
    colorScheme: AppColors.colorScheme,
    textTheme: AppStyles.textTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.grayDarker,
  );
}
