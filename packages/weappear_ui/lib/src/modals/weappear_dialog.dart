// ignore_for_file: public_member_api_docs

import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:weappear_localizations/weappear_localizations.dart';
import 'package:weappear_ui/src/buttons/weappear_material_button.dart';
import 'package:weappear_ui/src/common/common.dart';

class WeappearDialog extends StatelessWidget {
  const WeappearDialog({
    super.key,
    required this.title,
    required this.description,
    this.acceptText,
    this.onAccept,
    this.cancelText,
    this.onCancel,
  });

  final String title;

  final String description;

  final String? acceptText;

  final void Function()? onAccept;

  final String? cancelText;

  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      contentPadding: EdgeInsets.only(
        right: 28.sp,
        left: 28.sp,
        top: 38.sp,
        bottom: 20.sp,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Gravity',
              color: WeappearColors.grayText,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 30.sp),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Gravity',
              color: WeappearColors.grayBackground,
            ),
          ),
          SizedBox(height: 35.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (onCancel != null)
                WeappearMaterialButton(
                  height: 36.sp,
                  minWidth: 95.sp,
                  title: cancelText ?? context.l10n.cancel,
                  onPressed: () {
                    onCancel?.call();
                    Navigator.of(context).pop();
                  },
                  color: Colors.white,
                  fontColor: WeappearColors.blueActivated,
                  elevation: 0,
                ),
              const Spacer(),
              WeappearMaterialButton(
                height: 36.sp,
                minWidth: 95.sp,
                title: acceptText ?? context.l10n.accept,
                onPressed: () {
                  onAccept?.call();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// This functions shows the [WeappearDialog] widget.
  Future<void> show(BuildContext context) => showDialog<void>(
        context: context,
        builder: (_) => this,
      );
}
