part of 'login_bloc.dart';

@immutable
abstract class BlocEventLogin extends Equatable {
  const BlocEventLogin();

  @override
  List<Object> get props => [];
}

class BlocEventAttemptLogin extends BlocEventLogin {
  const BlocEventAttemptLogin({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
