import 'package:appsize/appsize.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weappear/login/bloc/login_bloc.dart';

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
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.sp,
                ),
                child: Form(
                  key: _formKey,
                  child: AutofillGroup(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        SvgPicture.asset(
                          'assets/icons/weappear_logo.svg',
                          width: 100.sp,
                        ),
                        SizedBox(
                          height: 40.sp,
                        ),
                        Text(
                          'INICIAR SESIÓN',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff303030),
                          ),
                        ),
                        SizedBox(
                          height: 90.sp,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          controller: _emailController,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecorations.authInputDecoration(hintext: 'Email'),
                        ),
                        SizedBox(
                          height: 32.sp,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          controller: _passwordController,
                          autocorrect: false,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecorations.authInputDecoration(
                            hintext: 'Contraseña',
                            suffixIcon: Icons.visibility_off,
                          ),
                        ),
                        SizedBox(
                          height: 7.sp,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: const Color(0xff4285F4),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.sp,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50.sp,
                          child: ElevatedButton(
                            onPressed: submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4285F4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                            ),
                            child: Text(
                              'INICIAR SESIÓN',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36.sp,
                        ),
                        Text(
                          '¿No tienes cuenta?',
                          style: TextStyle(
                            color: const Color(0xffC9C8C8),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'REGISTRATE',
                            style: TextStyle(
                              color: const Color(0xff4285F4),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
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
