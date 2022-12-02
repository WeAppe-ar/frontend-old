import 'dart:async';

import 'package:data_persistence/data_persistence.dart';
import 'package:weappear/app/app.dart';
import 'package:weappear/bootstrap.dart';

Future<void> main() async {
  final dataPersistenceRepository = DataPersistenceRepository();
  await dataPersistenceRepository.init();

  unawaited(
    bootstrap(
      () => App(
        dataPersistenceRepository: dataPersistenceRepository,
      ),
    ),
  );
}
