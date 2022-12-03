import 'package:another_flushbar/flushbar.dart';
import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:weappear_ui/weappear_ui.dart';

/// Personalized [Flushbar] widget. To cast use the .show() method.
class WeAppearSnackbar {
  /// Creates a [Flushbar] widget.
  const WeAppearSnackbar({
    required this.message,
    this.accentColor,
    this.backgroundColor = Colors.white,
    this.icon = Icons.info_outline,
    this.position = FlushbarPosition.TOP,
    this.duration = 2,
  });

  /// Creates a Success [Flushbar] widget.
  factory WeAppearSnackbar.success({
    required String message,
    Color? accentColor,
    Color backgroundColor = Colors.white,
    IconData icon = Icons.check_circle_outline,
    FlushbarPosition position = FlushbarPosition.TOP,
    int duration = 2,
  }) =>
      WeAppearSnackbar(
        message: message,
        accentColor: accentColor ?? WeappearColors.green,
        backgroundColor: backgroundColor,
        icon: icon,
        position: position,
        duration: duration,
      );

  /// Creates a Success [Flushbar] widget.
  factory WeAppearSnackbar.error({
    required String message,
    Color? accentColor,
    Color backgroundColor = Colors.white,
    IconData icon = Icons.error_outline,
    FlushbarPosition position = FlushbarPosition.TOP,
    int duration = 2,
  }) =>
      WeAppearSnackbar(
        message: message,
        accentColor: accentColor ?? WeappearColors.red,
        backgroundColor: backgroundColor,
        icon: icon,
        position: position,
        duration: duration,
      );

  /// The message to be displayed in the [Flushbar].
  final String message;

  /// The background color of the [Flushbar].
  final Color backgroundColor;

  /// The color of the accents in the [Flushbar].
  final Color? accentColor;

  /// The icon to be displayed in the [Flushbar].
  final IconData icon;

  /// The position of the [Flushbar].
  final FlushbarPosition position;

  /// The duration of the [Flushbar] in Seconds.
  final int duration;

  /// Shows the [Flushbar] in the [BuildContext].
  Future<void> show(BuildContext context) {
    final _accentColort = accentColor ?? WeappearColors.blueActivated;
    return Flushbar<void>(
      flushbarPosition: position,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      backgroundColor: backgroundColor,
      borderColor: _accentColort,
      shouldIconPulse: false,
      icon: Icon(
        icon,
        color: _accentColort,
      ),
      borderWidth: 2.sp,
      margin: EdgeInsets.symmetric(
        horizontal: 20.sp,
        vertical: 20.sp,
      ),
      messageSize: 12.sp,
      borderRadius: BorderRadius.circular(8.sp),
      message: message,
      messageColor: WeappearColors.grayText,
      duration: Duration(seconds: duration),
    ).show(context);
  }
}
