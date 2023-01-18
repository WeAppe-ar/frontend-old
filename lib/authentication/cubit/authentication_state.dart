part of 'authentication_cubit.dart';

enum AuthenticationStatus {
  initial,
  loading,
  sendingEmail,
  success,
  failure,
}

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = AuthenticationStatus.initial,
    this.loginResponse,
  });

  final AuthenticationStatus status;
  final LoginResponse? loginResponse;

  bool get isInitial => status == AuthenticationStatus.initial;
  bool get isLoading => status == AuthenticationStatus.loading;
  bool get isSendingEmail => status == AuthenticationStatus.sendingEmail;
  bool get isSuccess => status == AuthenticationStatus.success;
  bool get isFailure => status == AuthenticationStatus.failure;

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    LoginResponse? loginResponse,
  }) {
    return AuthenticationState(
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
