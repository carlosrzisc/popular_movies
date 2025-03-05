import 'package:flutter/material.dart';
import 'package:popular_movies/l10n/arb/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  AppLocalizations get l10n => AppLocalizations.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
}
