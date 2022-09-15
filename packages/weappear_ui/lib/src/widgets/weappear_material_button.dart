import 'package:flutter/material.dart';

// {@template weappear_material_nutton}
/// A [MaterialButton] with WeAppear styling.
/// {@endtemplate}
class WeappearMaterialButton extends StatefulWidget {
  /// {@macro weappear_text_field}
  WeappearMaterialButton({
    super.key,
    required this.height,
    required this.minWidth,
    this.padding,
    this.elevation,
    required this.borderRadius,
    required this.textMaterialButton,
    this.fontSize,
    this.fontWeight,
  });

  ///the height for the button
  double height;

  ///the width for the button
  double minWidth;

  /// The [EdgeInsetsGeometry] of the button.
  EdgeInsetsGeometry? padding;

  ///the elevation for the button
  double? elevation;

  /// The [BorderRadiusGeometry] of the button.
  BorderRadiusGeometry borderRadius;

  ///the string for the text
  String textMaterialButton;

  ///the font size for the text
  double? fontSize;

  ///the font weight for the text
  FontWeight? fontWeight;

  @override
  State<WeappearMaterialButton> createState() => _WeappearMaterialButtonState();
}

class _WeappearMaterialButtonState extends State<WeappearMaterialButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: widget.height,
      minWidth: widget.minWidth,
      padding: widget.padding,
      elevation: widget.elevation,
      color: const Color(0xff4285F4),
      shape: RoundedRectangleBorder(
        borderRadius: widget.borderRadius,
      ),
      child: Text(
        widget.textMaterialButton,
        style: TextStyle(
          color: const Color(0xffFBFBFB),
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
      ),
    );
  }
}
