import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:weappear_ui/src/common/common.dart';

/// {@template weappear_text_field}
/// A [TextField] with WeAppear styling.
/// {@endtemplate}
class WeappearTextFormField extends StatefulWidget {
  /// {@macro weappear_text_field}
  const WeappearTextFormField({
    super.key,
    this.handlePassword = false,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.controller,
  });

  /// Whether the text field will manage sensitive information.
  final bool handlePassword;

  /// The hint text to display.
  final String? hintText;

  /// The [TextInputType] of the text field.
  final TextInputType? keyboardType;

  /// The validator of the text field.
  final String? Function(String? text)? validator;

  /// The controller of the text field.
  final TextEditingController? controller;

  @override
  State<WeappearTextFormField> createState() => _WeappearTextFormFieldState();
}

class _WeappearTextFormFieldState extends State<WeappearTextFormField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.handlePassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.sp,
      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.disabled,
        autocorrect: false,
        keyboardType: widget.keyboardType,
        obscureText: obscure,
        validator: widget.validator,
        style: TextStyle(
          fontSize: 14.sp,
          color: WeappearColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        cursorColor: WeappearColors.blue,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xff898989),
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: const Color(0xffF1F1F1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.sp),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xffBDBDBD),
              width: 1.sp,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: WeappearColors.blue,
              width: 2.sp,
            ),
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 22.sp,
            maxWidth: 30.sp,
          ),
          suffixIcon: !widget.handlePassword
              ? Padding(
                  padding: EdgeInsets.only(right: 8.sp),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Icon(
                      obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      size: 22.sp,
                      color: const Color(0xff898989),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
