part of 'login_bloc.dart';

abstract class BlocStateLogin extends Equatable {
  const BlocStateLogin();

  @override
  List<Object> get props => [];

  bool get isLoading => this is BlocStateLoginAttempting;
  bool get isFailure => this is BlocStateLoginFailed;
  bool get isSuccess => this is BlocStateLoginSuccessful;
}

class BlocStateLoginInitial extends BlocStateLogin {}

class BlocStateLoginAttempting extends BlocStateLogin {}

class BlocStateLoginFailed extends BlocStateLogin {
  const BlocStateLoginFailed([this.error]);
  final Exception? error;

  @override
  List<Object> get props => [error ?? ''];
}

class BlocStateLoginSuccessful extends BlocStateLogin {
  const BlocStateLoginSuccessful({
    required this.loginResponse,
  });

  final LoginResponse loginResponse;

  @override
  List<Object> get props => [loginResponse];
}
