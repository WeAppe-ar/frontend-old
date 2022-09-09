import 'dart:async';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:equatable/equatable.dart';
import 'package:http_handler/http_handler.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class BlocLogin extends Bloc<BlocEventLogin, BlocStateLogin> {
  BlocLogin({
    required AuthRepository authRepository,
    required DataPersistenceRepository dataPersistenceRepository,
  })  : _authRepository = authRepository,
        _dataPersistenceRepository = dataPersistenceRepository,
        super(BlocStateLoginInitial()) {
    on<BlocEventAttemptLogin>(_tryLogin);
  }

  FutureOr<void> _tryLogin(
    BlocEventAttemptLogin event,
    Emitter<BlocStateLogin> emit,
  ) async {
    try {
      final loginResponse =
          await _authRepository.login(event.email, event.password);

      await _dataPersistenceRepository.setAccessToken(
        loginResponse.accessToken,
      );
      await _dataPersistenceRepository.setFirstName(
        loginResponse.user?.firstName,
      );
      await _dataPersistenceRepository.setLastName(
        loginResponse.user?.lastName,
      );

      emit(
        BlocStateLoginSuccessful(loginResponse: loginResponse),
      );
    } catch (e) {
      emit(
        BlocStateLoginFailed(e.toException),
      );
    }
  }

  final AuthRepository _authRepository;
  final DataPersistenceRepository _dataPersistenceRepository;

  void tryLogin(String email, String password) => add(
        BlocEventAttemptLogin(
          email: email,
          password: password,
        ),
      );
}
