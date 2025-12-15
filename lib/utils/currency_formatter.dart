import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(int value) {
    final formatter = NumberFormat('#,###', 'id_ID');
    return formatter.format(value).replaceAll(',', '.');
  }
}
