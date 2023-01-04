import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

// {@template weappear_Appbar}
/// A [AppBar] with WeAppear styling.
/// {@endtemplate}
class WeappearAppbar extends StatelessWidget with PreferredSizeWidget {
  /// {@template weappear_Appbar}
  const WeappearAppbar({
    super.key,
    this.icon,
    this.iconSize,
    this.fontSize,
    this.fontWeight = FontWeight.w700,
    this.title = 'Title',
    this.fontFamily,
    this.onPressed,
    this.sizedBoxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final _iconSize = iconSize ?? 30.sp;
    return Padding(
      padding: EdgeInsets.only(left: 10.sp, top: 25.sp),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
            ),
            iconSize: _iconSize,
          ),
          SizedBox(
            width: sizedBoxWidth,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? 20.sp,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  ///the icon
  final IconData? icon;

  ///the icon size
  final double? iconSize;

  ///the width for the sizedBox
  final double? sizedBoxWidth;

  ///The title
  final String title;

  /// The font size for the title.
  final double? fontSize;

  /// The font weight for the title.
  final FontWeight? fontWeight;

  ///the font family for the title;
  final String? fontFamily;

  ///the onpressed for the icon
  final void Function()? onPressed;
}
