import 'package:flutter/material.dart';

/// Themes for the application.
class WeAppearTheme {
  /// The default theme.
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'ProductSans',
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Color(0xFFFBFBFB),
      ),
      primaryColor: const Color(0xff303030),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
