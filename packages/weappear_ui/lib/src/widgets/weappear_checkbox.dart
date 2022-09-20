import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// {@template weappear_checkbox}
/// A [Checkbox] with WeAppear styling.
/// {@endtemplate}
class WeappearCheckbox extends StatefulWidget {
  /// {@macro weappear_checkbox}
  const WeappearCheckbox({
    super.key,
    this.value,
    this.onChanged,
    this.size,
  });

  /// The value of the checkbox.
  final bool? value;

  /// The callback that is called when the value of the checkbox should change.
  final void Function(bool checked)? onChanged;

  /// The size of the checkbox.
  final double? size;

  @override
  State<WeappearCheckbox> createState() => _WeappearCheckboxState();
}

class _WeappearCheckboxState extends State<WeappearCheckbox> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    final _size = widget.size ?? 20.sp;
    return GestureDetector(
      onTap: () {
        setState(() {
          _checked = !_checked;
          widget.onChanged?.call(_checked);
        });
      },
      child: SizedBox(
        width: _size,
        height: _size,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: _checked ? const Color(0xff4285F4) : Colors.transparent,
                  borderRadius: BorderRadius.circular(_size * 0.15),
                  border: Border.all(
                    color: _checked ? const Color(0xff4285F4) : const Color(0xff9F9F9F),
                    width: 1.5.sp,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
            if (_checked)
              Align(
                child: SvgPicture.asset(
                  'assets/icons/checked.svg',
                  width: _size * 0.5,
                  height: _size * 0.5,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
