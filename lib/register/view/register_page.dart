import 'package:appsize/appsize.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    var _checkedValue = false;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 34.sp,
                ),
                child: Form(
                  //key: _formKey,
                  child: AutofillGroup(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 118.sp,
                        ),
                        Image(
                          image: const AssetImage('assets/images/logo_weappear_light.png'),
                          width: 150.sp,
                        ),
                        Text(
                          'REGISTRARSE',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff303030),
                          ),
                        ),
                        SizedBox(
                          height: 90.sp,
                        ),
                        SizedBox(
                          width: 307.sp,
                          height: 42.sp,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff898989),
                              ),
                              filled: true,
                              fillColor: const Color(0xfff1f1f1),
                            ),
                            autovalidateMode: AutovalidateMode.always,
                          ),
                        ),
                        SizedBox(
                          height: 31.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 240.sp,
                              height: 42.sp,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Código de Verificación',
                                  labelStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff898989),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xfff1f1f1),
                                ),
                                autovalidateMode: AutovalidateMode.always,
                              ),
                            ),
                            SizedBox(
                              width: 64.sp,
                              height: 42.sp,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff4285f4),
                                  padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 12.sp),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Enviar',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 31.sp,
                        ),
                        CheckboxListTile(
                          activeColor: const Color(0xff4285f4),
                          selectedTileColor: const Color(0xff9f9f9f),
                          title: Text(
                            'He leido y estoy de acuerdo con las',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xff898989),
                            ),
                          ),
                          value: _checkedValue,
                          onChanged: (newValue) => setState(() {
                            _checkedValue = newValue ?? false;
                          }),
                          controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
                        )
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
