import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:weappear/app/app.dart';
import 'package:weappear/bootstrap.dart';

Future<void> main() async {
  final dataPersistenceRepository = DataPersistenceRepository();
  await dataPersistenceRepository.init();

  final authRepository = AuthRepository(
    dataPersistenceRepository.getAccessToken,
  );

  unawaited(
    bootstrap(
      () => App(
        authRepository: authRepository,
        dataPersistenceRepository: dataPersistenceRepository,
      ),
    ),
  );
}
