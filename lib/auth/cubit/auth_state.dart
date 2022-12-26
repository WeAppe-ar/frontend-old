part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  failure,
  sendFailure,
  incorrectCode,
}

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
    this.loginResponse,
    this.activationId,
  });

  final AuthStatus status;
  final LoginResponse? loginResponse;
  final String? activationId;

  bool get isInitial => status == AuthStatus.initial;
  bool get isLoading => status == AuthStatus.loading;
  bool get isSuccess => status == AuthStatus.success;
  bool get isFailure => status == AuthStatus.failure;

  AuthState copyWith({
    AuthStatus? status,
    LoginResponse? loginResponse,
    String? activationId,
  }) {
    return AuthState(
      status: status ?? this.status,
      loginResponse: loginResponse ?? this.loginResponse,
      activationId: activationId ?? this.activationId,
    );
  }

  @override
  List<Object?> get props => [
        status,
        loginResponse,
        activationId,
      ];
}
