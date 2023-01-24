import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:weappear_localizations/weappear_localizations.dart';

enum HomeOption {
  create,
  join,
  find,
}

class HomeOptionsModal extends StatelessWidget {
  const HomeOptionsModal({super.key});

  static Future<HomeOption?> show(BuildContext context) => showModalBottomSheet<HomeOption>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.sp),
          ),
        ),
        context: context,
        builder: (_) => const HomeOptionsModal(),
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
          children: [
            _HomeOptionTile(
              text: context.l10n.createaproject,
              option: HomeOption.create,
            ),
            _HomeOptionTile(
              text: context.l10n.joinaproject,
              option: HomeOption.join,
            ),
            _HomeOptionTile(
              text: context.l10n.findaproject,
              option: HomeOption.find,
            )
          ],
        ),
      ),
    );
  }
}

class _HomeOptionTile extends StatelessWidget {
  const _HomeOptionTile({
    required this.text,
    required this.option,
  });

  final String text;
  final HomeOption option;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43.sp,
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop(option);
        },
      ),
    );
  }
}
