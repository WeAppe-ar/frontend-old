import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

class CreateModal extends StatelessWidget {
  const CreateModal({super.key});

  static Future<bool?> show(BuildContext context) => showModalBottomSheet<bool>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.sp),
          ),
        ),
        context: context,
        builder: (_) => const CreateModal(),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 181.sp,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
      ),
    );
  }
}
