import 'package:flutter/material.dart';

class AppColors {
  /// Black
  static const black = Color(0xFF0D0D0D);

  /// White
  static const white = Color(0xFFFFFFFF);

  /// Primary
  static const primaryLighter = Color(0xFFF3F5FB);
  static const primaryLight = Color(0xFF64B0DF);
  static const primary = Color(0xFF3092D0);
  static const primaryDark = Color(0xFF0F649A);
  static const primaryDarker = Color(0xFF043250);

  /// Gray
  static const grayLighter = Color(0xFFF7F7F7);
  static const grayLight = Color(0xFFDBDBDB);
  static const gray = Color(0xFFA1A1A1);
  static const grayDark = Color(0xFF696969);
  static const grayDarker = Color(0xFF191919);

  /// Error
  static const errorLighter = Color(0xFFFBE4E4);
  static const errorLight = Color(0xFFEDA4A4);
  static const error = Color(0xFFDD4C4C);
  static const errorDark = Color(0xFFAB2222);
  static const errorDarker = Color(0xFF700C0C);

  /// Success
  static const successLighter = Color(0xFFE4F2D4);
  static const successLight = Color(0xFFB5E383);
  static const success = Color(0xFF84D030);
  static const successDark = Color(0xFF569412);
  static const successDarker = Color(0xFF305803);

  static const blackTranslucent = Color(0xC0000000);

  /// Color scheme
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF3092D0),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFF3092D0),
    secondary: Color(0xFF696969),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFF3F5FB),
    onSecondaryContainer: Color(0xFF696969),
    error: Color(0xFFDD4C4C),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFF3092D0),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF0D0D0D),
  );
}
