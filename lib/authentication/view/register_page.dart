import 'dart:async';

import 'package:appsize/appsize.dart';
import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:weappear/authentication/cubit/authentication_cubit.dart';
import 'package:weappear/authentication/view/login_page.dart';
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
      create: (_) => AuthenticationCubit(
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
  final MaskedTextController _otpController = MaskedTextController(mask: '000000');
  final _formKey = GlobalKey<FormState>();
  Timer _debounce = Timer(Duration.zero, () {});
  late final l10n = context.l10n;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.goNamed(PageOnboarding.name);
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
              child: Form(
                key: _formKey,
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
                          validator: (value) => validateEmail(value, context),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: l10n.email,
                        ),
                        SizedBox(height: 32.sp),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: WeappearTextFormField(
                                validator: (value) => validateOTPCode(value, context),
                                controller: _otpController,
                                keyboardType: TextInputType.number,
                                hintText: l10n.verificationCode,
                              ),
                            ),
                            SizedBox(width: 4.sp),
                            WeappearMaterialButton(
                              onPressed: () async => sendRegisterMail(_emailController.text),
                              minWidth: 64.sp,
                              height: 42.sp,
                              isLoading: state.isSendingEmail,
                              title: l10n.send,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 77.sp,
                        ),
                        WeappearMaterialButton(
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
                          l10n.youHaveAnAccount,
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
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthenticationCubit>().login(
            _emailController.text,
            _otpController.text,
          );
    }
  }

  Future<void> sendRegisterMail(String email) async {
    await context.read<AuthenticationCubit>().register(email);
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
