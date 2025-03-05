// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get takingLong => 'This is taking a bit longer than expected.\nPlease be patient.';

  @override
  String get genericError => 'Something went wrong. Make sure you are connected to the internet and try again.';

  @override
  String get noInternet => 'No internet connection. Please check your connection and try again.';

  @override
  String get reload => 'Reload';
}
