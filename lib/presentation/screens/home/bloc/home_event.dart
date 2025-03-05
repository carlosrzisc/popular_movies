part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.load() = _Load;
  const factory HomeEvent.subscriptionRequested() = _SubscriptionRequested;
}
