part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.loginResponse,
  });

  final LoginStatus status;
  final LoginResponse? loginResponse;

  bool get isInitial => status == LoginStatus.initial;
  bool get isLoading => status == LoginStatus.loading;
  bool get isSuccess => status == LoginStatus.success;
  bool get isFailure => status == LoginStatus.failure;

  LoginState copyWith({
    LoginStatus? status,
    LoginResponse? loginResponse,
  }) {
    return LoginState(
      status: status ?? this.status,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }

  @override
  List<Object?> get props => [
        status,
        loginResponse,
      ];
}
