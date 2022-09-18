import 'package:flutter/material.dart';
import 'package:weappear_ui/src/common/common.dart';

// {@template weappear_material_button}
/// A [MaterialButton] with WeAppear styling.
/// {@endtemplate}
class WeappearMaterialButton extends StatefulWidget {
  /// {@macro weappear_material_button}
  WeappearMaterialButton({
    super.key,
    required this.onPressed,
    required this.height,
    required this.minWidth,
    this.padding,
    this.elevation,
    required this.borderRadius,
    required this.textMaterialButton,
    this.fontSize,
    this.fontWeight,
  });

  /// The height for the button.
  double height;

  ///the onpressed for the button
  void Function() onPressed;

  /// The width for the button.
  double minWidth;

  /// The [EdgeInsetsGeometry] of the button.
  EdgeInsetsGeometry? padding;

  /// The elevation for the button.
  double? elevation;

  /// The [BorderRadiusGeometry] of the button.
  BorderRadiusGeometry borderRadius;

  /// The string for the text.
  String textMaterialButton;

  /// The font size for the text.
  double? fontSize;

  /// The font weight for the text.
  FontWeight? fontWeight;

  @override
  State<WeappearMaterialButton> createState() => _WeappearMaterialButtonState();
}

class _WeappearMaterialButtonState extends State<WeappearMaterialButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: null,
      height: widget.height,
      minWidth: widget.minWidth,
      padding: widget.padding,
      elevation: widget.elevation,
      disabledColor: const Color(0xffD9D9D9),
      hoverColor: const Color(0xff4285F4),
      color: const Color(0xff4285F4),
      shape: RoundedRectangleBorder(
        borderRadius: widget.borderRadius,
      ),
      child: Text(
        widget.textMaterialButton,
        style: TextStyle(
          color: const Color(0xffFFFFFF),
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
      ),
    );
  }
}
