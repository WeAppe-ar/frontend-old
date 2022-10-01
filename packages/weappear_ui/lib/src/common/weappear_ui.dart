import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template we_appear_ui}
/// This class have all the methods we use to change the system ui.
/// {@endtemplate}
class WeAppearUi {
  /// Initializes the system ui with the preferred values for the app.
  static void initUI() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
        systemNavigationBarColor: Colors.white,
      ),
    );
  }

  /// Sets the system navigation bar color.
  static void changeNavigationBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: color,
      ),
    );
  }
}
