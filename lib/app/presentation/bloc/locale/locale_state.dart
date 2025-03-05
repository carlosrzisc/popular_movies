part of 'locale_bloc.dart';

@freezed
abstract class LocaleState with _$LocaleState {
  const factory LocaleState.localeSet({Locale? locale}) = _LocaleSet;
}
