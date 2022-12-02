part of 'login_bloc.dart';

class BlocStateLogin extends Equatable {
  const BlocStateLogin();

  @override
  List<Object> get props => [];

  bool get isLoading => this is BlocStateLoginAttempting;
  bool get isFailure => this is BlocStateLoginFailed;
  bool get isSuccess => this is BlocStateLoginSuccessful;
}
