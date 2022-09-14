import 'package:appsize/appsize.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weappear/login/bloc/login_bloc.dart';

class PageRegister extends StatelessWidget {
  const PageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewRegister();
  }
}

class ViewRegister extends StatefulWidget {
  const ViewRegister({super.key});

  @override
  State<ViewRegister> createState() => _ViewRegisterState();
}

class _ViewRegisterState extends State<ViewRegister> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 45.sp,
                ),
                child: Form(
                  //key: _formKey,
                  child: AutofillGroup(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 118.sp,
                        ),
                        Image(
                          image: const AssetImage('assets/images/logo_weappear_light.png'),
                          width: 200.sp,
                        ),
                        Text(
                          'INICIAR SESIÓN',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff303030),
                          ),
                        ),
                        SizedBox(
                          height: 90.sp,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                        ),
                        SizedBox(
                          height: 40.sp,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
