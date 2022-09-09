import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

/// Personalized [TextFormField] widget.
class CustomTextField extends StatefulWidget {
  /// Creates a [TextFormField] widget.
  const CustomTextField({
    Key? key,
    this.autofillHints = const [],
    this.labelText,
    @Deprecated('Use [labelText] instead') this.hintText,
    this.icon,
    this.inputType = TextInputType.name,
    this.controller,
    this.onChanged,
    this.validator,
    this.radius = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
    this.onSubmitted,
    this.focusNode,
    this.height,
    this.width,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.passwordIsCorrect = false,
  })  : handlePassword = false,
        showStrength = false,
        super(key: key);

  /// Creates a [TextFormField] widget that defaults its properties to being an Email Input Field.
  CustomTextField.email({
    Key? key,
    this.labelText,
    @Deprecated('Use [labelText] instead') this.hintText,
    this.icon,
    this.controller,
    this.onChanged,
    this.validator,
    this.radius = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
    this.onSubmitted,
    this.focusNode,
    this.height,
    this.width,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.passwordIsCorrect = false,
  })  : autofillHints = [
          AutofillHints.email,
        ],
        handlePassword = false,
        showStrength = false,
        inputType = TextInputType.emailAddress,
        super(key: key);

  /// Creates a [TextFormField] widget that defaults its properties to being a Password Input Field.
  CustomTextField.password({
    Key? key,
    this.labelText,
    @Deprecated('Use [labelText] instead') this.hintText,
    this.icon,
    this.showStrength = false,
    this.controller,
    this.onChanged,
    this.validator,
    this.radius = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
    this.onSubmitted,
    this.focusNode,
    this.height,
    this.width,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.passwordIsCorrect = false,
  })  : autofillHints = [
          AutofillHints.password,
        ],
        handlePassword = true,
        inputType = TextInputType.visiblePassword,
        super(key: key);

  /// The Hints that are used to autofill the textfield.
  final List<String> autofillHints;

  /// The label text of the [TextFormField].
  final String? labelText;

  /// The hint text of the [TextFormField].
  @Deprecated('Use [labelText] instead')
  final String? hintText;

  /// Whether to show a bar on the bottom with the strength of the password.
  final bool showStrength;

  /// The icon of the [TextFormField].
  final Widget? icon;

  /// Whether the widget should handle its own password.
  final bool handlePassword;

  /// The type of the [TextFormField].
  final TextInputType inputType;

  /// The controller of the [TextFormField].
  final TextEditingController? controller;

  /// The callback called when the [TextFormField] changes.
  final void Function(String)? onChanged;

  /// The callback called when the [TextFormField] is submitted or needs to be validated.
  final String? Function(String?, BuildContext)? validator;

  /// The radius of the [TextFormField].
  final double radius;

  /// The padding of the [TextFormField].
  final EdgeInsetsGeometry padding;

  /// The callback called when the [TextFormField] is submitted.
  final void Function(String?)? onSubmitted;

  /// The focus node of the [TextFormField].
  final FocusNode? focusNode;

  /// TextField Height
  final double? height;

  /// TextField Width
  final double? width;

  /// If the [TextFormField] autovalidates itself.
  final AutovalidateMode autovalidateMode;

  /// If the password is 8 or more characters.
  final bool passwordIsCorrect;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final FocusNode _focusNode;
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.handlePassword;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: const BorderSide(
        color: Color(0xff303437),
      ),
    );
    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: const BorderSide(
        color: Color(0xff7C7C7E),
        width: 2,
      ),
    );
    return Column(
      children: [
        Container(
          padding: widget.padding,
          child: TextFormField(
            focusNode: _focusNode,
            controller: widget.controller,
            onChanged: (value) {
              if (widget.showStrength) {
                setState(() {});
              }
              widget.onChanged?.call(value);
            },
            validator: (value) => widget.validator?.call(value, context),
            autofillHints: widget.autofillHints,
            obscureText: obscure,
            autocorrect: false,
            keyboardType: widget.inputType,
            autovalidateMode: widget.autovalidateMode,
            onFieldSubmitted: widget.onSubmitted,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: widget.height ?? 10,
                horizontal: widget.width ?? 15,
              ),
              filled: true,
              border: border,
              enabledBorder: border,
              focusedBorder: focusBorder,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: const BorderSide(
                  color: Color(0xffFC5D47),
                  width: 2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: const BorderSide(
                  color: Color(0xffFC5D47),
                  width: 2,
                ),
              ),
              focusColor: Colors.white,
              fillColor: const Color(0xff242528),
              hoverColor: Colors.white,
              hintStyle: const TextStyle(color: Color(0xffafafaf)),
              errorStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xffE57373),
              ),
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: Color(0xffA7A8A9)),
              errorMaxLines: 10,
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 12),
                child: widget.handlePassword
                    ? GestureDetector(
                        child: Icon(
                          obscure ? Icons.visibility_off_outlined : Icons.visibility,
                          color: const Color(0xffA7A8A9),
                        ),
                        onTap: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                      )
                    : widget.icon,
              ),
            ),
          ),
        ),
        if (widget.showStrength)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 5,
            ),
            child: FlutterPasswordStrength(
              password: widget.controller?.text,
            ),
          ),
      ],
    );
  }
}
