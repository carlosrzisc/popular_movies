import 'dart:async';

import 'package:app_storage/app_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'locale_bloc.freezed.dart';
part 'locale_event.dart';
part 'locale_state.dart';

@lazySingleton
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc(this._storage) : super(const LocaleState.localeSet()) {
    on<_Load>(_onLoad);
    on<_SwitchLocale>(_onSwitchLocale);
  }
  final StorageService _storage;

  void _onLoad(_Load event, Emitter<LocaleState> emit) {
    final storedLocale = _storage.language.load();
    if (storedLocale == null) {
      emit(const LocaleState.localeSet(locale: Locale('en')));
    } else {
      emit(LocaleState.localeSet(locale: Locale(storedLocale)));
    }
  }

  FutureOr<void> _onSwitchLocale(
    _SwitchLocale event,
    Emitter<LocaleState> emit,
  ) async {
    await _storage.language.save(event.locale.languageCode);
    add(const LocaleEvent.load());
  }
}
