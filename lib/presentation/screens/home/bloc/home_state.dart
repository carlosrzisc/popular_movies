part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loadInProgress() = LoadInProgress;
  const factory HomeState.loadSuccess(List<TMovie> movies) = LoadMoviesSuccess;
  const factory HomeState.loadFailure() = LoadMoviesFailure;
}
