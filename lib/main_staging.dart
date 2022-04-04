import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/cupertino.dart';
import 'package:weappear/app/app.dart';

Future<void> main() async {
  final dataPersistenceRepository = DataPersistenceRepository();
  await dataPersistenceRepository.init();

  final authRepository = AuthRepository(
    dataPersistenceRepository.getAccessToken,
  );

  runApp(
    App(
      authRepository: authRepository,
      dataPersistenceRepository: dataPersistenceRepository,
    ),
  );
}
