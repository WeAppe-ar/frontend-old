import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

// {@template weappear_floating_action_button}
/// A [FloatingActionButton] with WeAppear styling.
/// {@endtemplate}
class WeappearFloatingActionButton extends StatefulWidget {
  /// {@macro weappear_floating_action_button}
  const WeappearFloatingActionButton({
    super.key,
  });

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
        onPressed: () {},
        elevation: 4.sp,
        splashColor: const Color.fromARGB(255, 171, 200, 247),
        backgroundColor: const Color(0xffFFFFFF),
        child: Icon(
          Icons.add,
          color: const Color(0xff4285F4),
          size: 25.sp,
        ),
      ),
    );
  }
}
