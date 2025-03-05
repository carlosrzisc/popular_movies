import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String? formattedDate([String? locale]) {
    final formatter = DateFormat('yMMMMd', locale);
    return formatter.format(this);
  }
}
