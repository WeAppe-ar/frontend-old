import 'dart:async';

import 'package:appsize/appsize.dart';
import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:weappear/auth/cubit/auth_cubit.dart';
import 'package:weappear/auth/view/create_account_page.dart';
import 'package:weappear/auth/view/login_page.dart';

import 'package:weappear/onboarding/view/onboarding_page.dart';
import 'package:weappear/utils/validators.dart';
import 'package:weappear_localizations/weappear_localizations.dart';
import 'package:weappear_ui/weappear_ui.dart';

class PageRegister extends StatelessWidget {
  const PageRegister({super.key});

  static String get name => 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(
        dataPersistenceRepository: context.read<DataPersistenceRepository>(),
        client: context.read<Client>(),
      ),
      child: const ViewRegister(),
    );
  }
}

class ViewRegister extends StatefulWidget {
  const ViewRegister({super.key});

  @override
  State<ViewRegister> createState() => _ViewRegisterState();
}

class _ViewRegisterState extends State<ViewRegister> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final _codeKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  Timer _debounce = Timer(Duration.zero, () {});
  late final l10n = context.l10n;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.goNamed(
            PageCreateAccount.name,
            extra: state.activationId,
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
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 34.sp,
              ),
              child: AutofillGroup(
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
                        Form(
                          key: _emailKey,
                          child: WeappearTextFormField(
                            key: const Key('emailInput'),
                            validator: (value) => validateEmail(value, context),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: l10n.email,
                          ),
                        ),
                        SizedBox(height: 32.sp),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Form(
                                key: _codeKey,
                                child: WeappearTextFormField(
                                  validator: (value) => validateOTP(value, context),
                                  controller: _codeController,
                                  keyboardType: TextInputType.number,
                                  hintText: l10n.verificationCode,
                                  onSaved: submit,
                                ),
                              ),
                            ),
                            SizedBox(width: 5.sp),
                            WeappearMaterialButton(
                              onPressed: sendCode,
                              height: 42.sp,
                              minWidth: 64.sp,
                              title: l10n.send,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 77.sp,
                        ),
                        WeappearMaterialButton(
                          key: const Key('loginButton'),
                          onPressed: submit,
                          height: 48.sp,
                          minWidth: 285.sp,
                          isLoading: state.isLoading,
                          title: l10n.register.toUpperCase(),
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

  void sendCode([dynamic _]) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_emailKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().sendEmailCode(
            _emailController.text,
          );
    }
  }

  void submit([dynamic _]) {
    FocusScope.of(context).requestFocus(FocusNode());
    final codeValid = _codeKey.currentState?.validate() ?? false;
    final emailValid = _emailKey.currentState?.validate() ?? false;
    if (codeValid && emailValid) {
      context.read<AuthCubit>().verifyEmail(
            _emailController.text,
            _codeController.text,
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
