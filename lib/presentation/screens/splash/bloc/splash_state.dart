part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loadInProgress() = _LoadInProgress;
  const factory SplashState.loaded() = _Loaded;
}
