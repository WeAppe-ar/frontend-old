import 'dart:async';

import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/cupertino.dart';
import 'package:weappear/app/app.dart';

Future<void> main() async {
  final dataPersistenceRepository = DataPersistenceRepository();
  await dataPersistenceRepository.init();
  final client = Client(
    authority: 'stg.weappe.ar',
    token: dataPersistenceRepository.getAccessToken,
  );

  runApp(
    App(
      client: client,
      dataPersistenceRepository: dataPersistenceRepository,
    ),
  );
}
