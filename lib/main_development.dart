import 'dart:async';

import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:weappear/app/app.dart';
import 'package:weappear/bootstrap.dart';

Future<void> main() async {
  final dataPersistenceRepository = DataPersistenceRepository();
  await dataPersistenceRepository.init();
  final client = Client(
    authority: '10.0.2.2:8000',
    token: dataPersistenceRepository.getAccessToken,
  );

  unawaited(
    bootstrap(
      () => App(
        client: client,
        dataPersistenceRepository: dataPersistenceRepository,
      ),
    ),
  );
}
