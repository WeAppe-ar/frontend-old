import 'package:appsize/appsize.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weappear/login/bloc/login_bloc.dart';
import 'package:weappear_localizations/weappear_localizations.dart';
import 'package:weappear_ui/weappear_ui.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BlocLogin(
        authRepository: context.read<AuthRepository>(),
        dataPersistenceRepository: context.read<DataPersistenceRepository>(),
      ),
      child: const ViewLogin(),
    );
  }
}

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocLogin, BlocStateLogin>(
      listener: (context, state) {
        if (state is BlocStateLoginSuccessful) {
          // Navigator.of(context).pushReplacementNamed(
          //   Routes.home,
          // );
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
                          context.l10n.signIn.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff303030),
                          ),
                        ),
                        SizedBox(height: 92.sp),
                        WeappearTextFormField(
                          handlePassword: true,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: context.l10n.email,
                        ),
                        SizedBox(height: 32.sp),
                        WeappearTextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: context.l10n.password,
                        ),
                        SizedBox(height: 7.sp),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Text(
                              context.l10n.forgotYourPassword,
                              style: TextStyle(
                                color: const Color(0xff4285F4),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 77.sp,
                        ),
                        WeappearMaterialButton(
                          onPressed: () {},
                          height: 54.sp,
                          minWidth: 285.sp,
                          title: context.l10n.signIn.toUpperCase(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                        ),
                        SizedBox(
                          height: 36.sp,
                        ),
                        Text(
                          context.l10n.dontHaveAnAccount,
                          style: TextStyle(
                            color: const Color(0xffC9C8C8),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Text(
                            context.l10n.register.toUpperCase(),
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
      context.read<BlocLogin>().tryLogin(
            _emailController.text,
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
