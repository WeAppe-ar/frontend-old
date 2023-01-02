import 'package:bloc/bloc.dart';
import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required Client client,
    required DataPersistenceRepository dataPersistenceRepository,
  })  : _client = client,
        _dataPersistenceRepository = dataPersistenceRepository,
        super(const AuthState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final loginResponse = await _client.login(
        email: email,
        password: password,
      );
      if (loginResponse == null) {
        emit(state.copyWith(status: AuthStatus.failure));
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
          status: AuthStatus.success,
          loginResponse: loginResponse,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }

  Future<void> sendEmailCode(String email) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final response = await _client.register(email);
      if (response ?? false) {
        return emit(state.copyWith(status: AuthStatus.initial));
      }
      return emit(state.copyWith(status: AuthStatus.sendFailure));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }

  Future<void> verifyEmail(String email, String otp) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final response = await _client.verifyEmail(email: email, code: otp);
      if (response != null) {
        return emit(
          state.copyWith(
            status: AuthStatus.success,
            activationId: response.id?.$oid,
          ),
        );
      }
      emit(state.copyWith(status: AuthStatus.incorrectCode));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }

  Future<void> activateUser(
    String email,
    String activationId,
    String firstName,
    String lastName,
    String password,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final response = await _client.activateUser(
        activationId: activationId,
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
      );

      if (response != null) {
        return emit(state.copyWith(status: AuthStatus.success));
      }
      emit(state.copyWith(status: AuthStatus.failure));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }

  final Client _client;
  final DataPersistenceRepository _dataPersistenceRepository;
}
