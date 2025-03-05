part of 'locale_bloc.dart';

@freezed
class LocaleEvent with _$LocaleEvent {
  const factory LocaleEvent.load() = _Load;
  const factory LocaleEvent.switchLocale(Locale locale) = _SwitchLocale;
}
