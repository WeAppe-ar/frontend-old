import 'package:bloc/bloc.dart';
import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required Client client,
    required DataPersistenceRepository dataPersistenceRepository,
  })  : _client = client,
        _dataPersistenceRepository = dataPersistenceRepository,
        super(const LoginState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final loginResponse = await _client.login(
        email: email,
        password: password,
      );
      if (loginResponse == null) {
        emit(state.copyWith(status: LoginStatus.failure));
        return;
      }
      await Future.wait([
        _dataPersistenceRepository.setAccessToken(
          loginResponse.accessToken,
        ),
        _dataPersistenceRepository.setRefreshToken(
          loginResponse.refreshToken,
        )
      ]);

      emit(
        state.copyWith(
          status: LoginStatus.success,
          loginResponse: loginResponse,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  final Client _client;
  final DataPersistenceRepository _dataPersistenceRepository;
}
