import 'package:intl/intl.dart';

extension StringExt on String {
  String get formattedNumber => NumberFormat('#,###').format(int.parse(this));
}
