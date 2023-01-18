import 'package:bloc/bloc.dart';
import 'package:client/src/client.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required dataPersistenceRepository, required Client client}) : super(HomeInitial());
}
