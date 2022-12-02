import 'dart:async';

import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/cupertino.dart';
import 'package:weappear/app/app.dart';

Future<void> main() async {
  final dataPersistenceRepository = DataPersistenceRepository();
  await dataPersistenceRepository.init();

  runApp(
    App(
      dataPersistenceRepository: dataPersistenceRepository,
    ),
  );
}
