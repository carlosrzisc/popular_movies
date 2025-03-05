// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get takingLong => 'Esto esta tomando mas tiempo de lo esperado';

  @override
  String get genericError => 'Algo salió mal. Asegurate de estar conectado a internet e intenta de nuevo.';

  @override
  String get noInternet => 'No hay conexión a internet. Por favor revisa tu conexión e intenta de nuevo.';
}
