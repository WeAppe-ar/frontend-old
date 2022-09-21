import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:weappear_ui/src/widgets/weappear_material_button.dart';

/// {@template weappear_alert_dialog}
/// A [AlertDialog] with WeAppear styling.
/// {@endtemplate}

class WeappearAlertDialog extends StatelessWidget {
  /// {@macro weappear_alert_dialog}
  const WeappearAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.cancel = false,
  });

  /// The title of the AlertDialog
  final String title;

  /// The content of the AlertDialog
  final String content;

  /// To enable the optional cancel button
  final bool? cancel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 321.sp,
      height: 281.sp,
      child: AlertDialog(
        backgroundColor: Colors.white,
        elevation: 4,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            fontFamily: 'Gravity',
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: 'Gravity',
          ),
        ),
        titlePadding: EdgeInsets.only(top: 38.sp, left: 29.sp, right: 28.sp, bottom: 33.sp),
        contentPadding: EdgeInsets.only(right: 50.sp, left: 29.sp),
        actionsPadding: EdgeInsets.only(right: 28.sp, bottom: 20.sp, left: 28.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (cancel != false)
                TextButton(
                  onPressed: () {},
                  child: const Text('CANCELAR'),
                ),
              const Spacer(),
              WeappearMaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                height: 36.sp,
                minWidth: 95.sp,
                title: 'ACEPTAR',
                fontSize: 14.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
