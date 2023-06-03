import 'package:intl/intl.dart';

String formatDate({required String date, String? format}) {
  return DateFormat(format ?? 'd MMM y').format(DateTime.parse(date));
}

String formatDateTime({String? date, String? format}) {
  return DateFormat(format ?? 'd MMM y hh:mm:ss a').format(DateTime.now());
}
