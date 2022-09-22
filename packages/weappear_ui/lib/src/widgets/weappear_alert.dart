import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:weappear_ui/weappear_ui.dart';

/// {@template weappear_alert}
/// A [AlertDialog] with WeAppear styling.
/// {@endtemplate}

class WeappearAlert extends StatelessWidget {
  /// {@macro weappear_alert_dialog}
  const WeappearAlert({
    super.key,
    this.cancel = false,
    required this.title,
    required this.content,
    this.width,
    this.height,
  });

  /// To enable the optional cancel button
  final bool cancel;

  /// The title of the AlertDialog
  final String title;

  /// The content of the AlertDialog
  final String content;

  ///the width of the container
  final double? width;

  ///the height of the container
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 38.sp,
        bottom: 20.sp,
        left: 29.sp,
        right: 28.sp,
      ),
      width: width ?? 321.sp,
      height: height ?? 281.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 5,
            offset: Offset(0, 4.sp), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff303030),
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Gravity',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 22.sp),
            child: Text(
              content,
              strutStyle: const StrutStyle(
                leading: 0.3,
              ),
              style: const TextStyle(
                color: Color(0xff545454),
                fontWeight: FontWeight.w400,
                fontSize: 24,
                fontFamily: 'Gravity',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (cancel != false)
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'CANCELAR',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Gravity',
                    ),
                  ),
                ),
              const Spacer(),
              WeappearMaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                height: 36.sp,
                minWidth: 95.sp,
                title: 'ACEPTAR',
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
