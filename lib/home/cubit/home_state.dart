part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure,
  internetFailure,
  typeFailure,
}

/// {@template home_state}
/// The cubit state of the home feature.
/// {@endtemplate}
class HomeState extends Equatable {
  /// {@macro home_state}
  const HomeState({
    this.status = HomeStatus.initial,
  });

  final HomeStatus status;

  bool get isInitial => status == HomeStatus.initial;
  bool get isLoading => status == HomeStatus.loading;
  bool get isSuccess => status == HomeStatus.success;
  bool get isFailure => status == HomeStatus.failure;
  bool get isInternetFailure => status == HomeStatus.internetFailure;
  bool get isTypeFailure => status == HomeStatus.typeFailure;

  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
