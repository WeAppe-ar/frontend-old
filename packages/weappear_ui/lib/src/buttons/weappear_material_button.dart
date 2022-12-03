import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:weappear_ui/src/common/weappear_colors.dart';

// {@template weappear_material_button}
/// A [MaterialButton] with WeAppear styling.
/// {@endtemplate}
class WeappearMaterialButton extends StatelessWidget {
  /// {@macro weappear_material_button}
  const WeappearMaterialButton({
    super.key,
    required this.onPressed,
    required this.height,
    required this.minWidth,
    this.padding,
    this.elevation,
    required this.title,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.shape,
    this.color = const Color(0xff4285F4),
    this.useHighlightElevation = true,
    this.fontColor = const Color(0xffFBFBFB),
    this.disabledColor = const Color(0xffA1C3FB),
    this.isLoading = false,
  });

  /// This method creates a [WeappearMaterialButton] with outlined styling.
  factory WeappearMaterialButton.outlined({
    required void Function()? onPressed,
    required double height,
    required double minWidth,
    required String title,
    double? fontSize,
    FontWeight? fontWeight,
    bool isLoading = false,
  }) {
    final isActive = onPressed != null;

    return WeappearMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.sp),
        side: BorderSide(
          color: isActive ? WeappearColors.blueActivated : const Color(0xffA1C3FB),
          width: 1.sp,
        ),
      ),
      disabledColor: Colors.transparent,
      onPressed: onPressed,
      height: height,
      minWidth: minWidth,
      padding: EdgeInsets.zero,
      elevation: 0,
      color: Colors.transparent,
      title: title,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontColor: isActive ? WeappearColors.blueActivated : const Color(0xffA1C3FB),
      useHighlightElevation: false,
      isLoading: isLoading,
    );
  }

  /// The height for the button.
  final double height;

  ///the onpressed for the button
  final void Function()? onPressed;

  /// The width for the button.
  final double minWidth;

  /// The [EdgeInsetsGeometry] of the button.
  final EdgeInsetsGeometry? padding;

  /// The elevation for the button.
  final double? elevation;

  /// The string for the text.
  final String title;

  /// The font size for the text.
  final double? fontSize;

  /// The font weight for the text.
  final FontWeight? fontWeight;

  /// The [Color] of the button.
  final Color color;

  /// The [Color] of the button text.
  final Color fontColor;

  /// The disabled [Color] of the button.
  final Color disabledColor;

  /// The [ShapeBorder] for the button.
  final ShapeBorder? shape;

  /// Whether we use the highlightElevation is enabled or not.
  final bool useHighlightElevation;

  /// Whether the button is loading or not.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height,
      minWidth: minWidth,
      padding: padding,
      highlightElevation: useHighlightElevation ? 5 : 0,
      elevation: elevation,
      disabledColor: disabledColor,
      hoverColor: const Color(0xff4285F4),
      color: color,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.sp),
          ),
      child: isLoading
          ? CircularProgressIndicator(
              color: fontColor,
            )
          : Text(
              title,
              style: TextStyle(
                color: fontColor,
                fontSize: 16.sp,
                fontFamily: 'Gravity',
                fontWeight: fontWeight,
              ).copyWith(
                fontSize: fontSize,
              ),
            ),
    );
  }
}
