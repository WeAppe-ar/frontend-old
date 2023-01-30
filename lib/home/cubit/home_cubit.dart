import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:client/src/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

abstract class HomeCubitBase {
  const HomeCubitBase();

  /// This method is used to get all the proyects we
  /// are going to be using in the home feature.
  Future<void> init();
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required Client client,
    required DataPersistenceRepository dataPersistenceRepository,
  })  : _client = client,
        _dataPersistenceRepository = dataPersistenceRepository,
        super(const HomeState());

  final Client _client;
  final DataPersistenceRepository _dataPersistenceRepository;

  Future<void> init() async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {} catch (error) {}
  }
}
