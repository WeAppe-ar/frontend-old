import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:weappear_localizations/weappear_localizations.dart';
import 'package:weappear_ui/src/buttons/weappear_material_button.dart';
import 'package:weappear_ui/src/common/common.dart';

/// {@template weappear_dialog}
/// The dialog used in WeAppear.
/// {@endtemplate}
class WeappearDialog extends StatelessWidget {
  /// {@macro weappear_dialog}
  const WeappearDialog({
    super.key,
    required this.title,
    required this.description,
    this.acceptText,
    this.onAccept,
    this.cancelText,
    this.onCancel,
  });

  /// The title of the dialog.
  final String title;

  /// The description of the dialog.
  final String description;

  /// The text of the accept button.
  final String? acceptText;

  /// The callback of the accept button.
  final void Function()? onAccept;

  /// The text of the cancel button.
  final String? cancelText;

  /// The callback of the cancel button.
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
