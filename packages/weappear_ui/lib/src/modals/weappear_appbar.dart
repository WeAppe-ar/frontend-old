import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:weappear_ui/weappear_ui.dart';

// {@template weappear_Appbar}
/// A [AppBar] with WeAppear styling.
/// {@endtemplate}
class WeappearAppbar extends StatelessWidget with PreferredSizeWidget {
  /// {@template weappear_Appbar}
  const WeappearAppbar({
    super.key,
    required this.title,
  });

  ///The title
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      shadowColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: WeappearColors.grayText,
              ),
              iconSize: 30.sp,
            ),
          ),
          Align(
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: WeappearColors.grayText,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
