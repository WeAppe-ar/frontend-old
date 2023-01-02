import 'dart:async';

import 'package:appsize/appsize.dart';
import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:weappear/auth/cubit/auth_cubit.dart';
import 'package:weappear/auth/view/login_page.dart';

import 'package:weappear/utils/validators.dart';
import 'package:weappear_localizations/weappear_localizations.dart';
import 'package:weappear_ui/weappear_ui.dart';

class PageFinishRegister extends StatelessWidget {
  const PageFinishRegister({
    super.key,
    required this.email,
    required this.activationId,
  });

  static String get name => 'finish-register';

  final String email;
  final String activationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(
        dataPersistenceRepository: context.read<DataPersistenceRepository>(),
        client: context.read<Client>(),
      ),
      child: ViewFinishRegister(
        email: email,
        activationId: activationId,
      ),
    );
  }
}

class ViewFinishRegister extends StatefulWidget {
  const ViewFinishRegister({
    super.key,
    required this.email,
    required this.activationId,
  });

  final String email;
  final String activationId;

  @override
  State<ViewFinishRegister> createState() => _ViewFinishRegisterState();
}

class _ViewFinishRegisterState extends State<ViewFinishRegister> {
  Timer _debounce = Timer(Duration.zero, () {});
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final l10n = context.l10n;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.goNamed(
            PageLogin.name,
            extra: true,
          );
        } else if (state.isFailure) {
          if (_debounce.isActive) return;
          WeAppearSnackbar.error(message: l10n.invalidCredentials).show(context);
          _debounce = Timer(const Duration(seconds: 3), () {});
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            body: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 34.sp,
                ),
                child: AutofillGroup(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 170.sp),
                        SvgPicture.asset(
                          'assets/icons/weappear_logo.svg',
                          width: 100.sp,
                        ),
                        SizedBox(height: 40.sp),
                        Text(
                          l10n.register.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff303030),
                          ),
                        ),
                        SizedBox(height: 92.sp),
                        WeappearTextFormField(
                          validator: (value) => validateName(value, context),
                          hintText: l10n.firstName,
                          controller: _firstNameController,
                        ),
                        SizedBox(height: 10.sp),
                        WeappearTextFormField(
                          validator: (value) => validateName(value, context),
                          hintText: l10n.lastName,
                          controller: _lastNameController,
                        ),
                        SizedBox(height: 10.sp),
                        WeappearTextFormField(
                          key: const Key('passwordInput'),
                          validator: (value) => validatePassword(value, context),
                          handlePassword: true,
                          controller: _passwordController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: l10n.password,
                        ),
                        SizedBox(
                          height: 77.sp,
                        ),
                        WeappearMaterialButton(
                          onPressed: submit,
                          height: 48.sp,
                          minWidth: 285.sp,
                          isLoading: state.isLoading,
                          title: l10n.finishRegister.toUpperCase(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                        ),
                        SizedBox(
                          height: 36.sp,
                        ),
                        Text(
                          l10n.alreadyHaveAnAccount,
                          style: TextStyle(
                            color: const Color(0xffC9C8C8),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => context.goNamed(PageLogin.name),
                          child: Text(
                            l10n.signIn.toUpperCase(),
                            style: TextStyle(
                              color: const Color(0xff4285F4),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void submit([dynamic _]) {
    FocusScope.of(context).requestFocus(FocusNode());
    final formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      context.read<AuthCubit>().activateUser(
            widget.email,
            widget.activationId,
            _firstNameController.text,
            _lastNameController.text,
            _passwordController.text,
          );
    }
  }
}

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintext,
    IconData? suffixIcon,
  }) {
    return InputDecoration(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff4285F4),
        ),
      ),
      hintText: hintext,
      suffixIcon: suffixIcon != null
          ? Icon(
              suffixIcon,
            )
          : null,
    );
  }
}
