import 'package:auth_repository/auth_repository.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.1,
                      ),
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: AutofillGroup(
                            child: Card(
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: constraints.maxHeight * 0.02,
                                  ),
                                  Center(
                                    child: Text(
                                      'INICIAR SESION',
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.08,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff303030),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.02,
                                  ),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.always,
                                    controller: _emailController,
                                  ),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.always,
                                    controller: _passwordController,
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * (state is BlocStateLoginFailed ? 0.01 : 0.05),
                                  ),
                                  if (state is BlocStateLoginFailed)
                                    Text(
                                      state.error.toString(),
                                    ),
                                  ElevatedButton(
                                    onPressed: submit,
                                    child: const Text('Login'),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.05,
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
