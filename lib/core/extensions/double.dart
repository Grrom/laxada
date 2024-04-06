import 'package:intl/intl.dart';

extension StringExpressions on double {
  String get toPeso {
    final formattedValue = NumberFormat("#,##0.00", "en_US").format(this);
    if (formattedValue.endsWith(".00")) {
      return "₱ ${formattedValue.substring(0, formattedValue.length - 3)}";
    } else {
      return "₱ $formattedValue";
    }
  }

  String get toPercentage => "${toString()}%";
}
