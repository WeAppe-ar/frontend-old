import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

// {@template weappear_floating_action_button}
/// A [FloatingActionButton] with WeAppear styling.
/// {@endtemplate}
class WeappearFloatingActionButton extends StatefulWidget {
  /// {@macro weappear_floating_action_button}
  const WeappearFloatingActionButton({
    super.key,
    required this.onPressed,
    this.heroTag,
  });

  ///the onpressed for the button
  final void Function()? onPressed;

  /// The hero tag for the button.
  final String? heroTag;

  @override
  State<WeappearFloatingActionButton> createState() => _WeappearFloatingActionButtonState();
}

class _WeappearFloatingActionButtonState extends State<WeappearFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.sp,
      width: 52.sp,
      child: FloatingActionButton(
        heroTag: widget.heroTag,
        onPressed: widget.onPressed,
        elevation: 4,
        splashColor: const Color(0xffDBE1EB),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: const Color(0xff4285F4),
          size: 25.sp,
        ),
      ),
    );
  }
}
