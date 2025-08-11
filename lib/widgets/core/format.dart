// تحويل التاريخ من النص إلى DateTime
import 'package:intl/intl.dart';

String formatDate(String dateStr) {
  try {
    DateTime date = DateTime.parse(dateStr);
    return DateFormat('dd MMM yyyy').format(date);
    // مثال: 11 Aug 2025
  } catch (e) {
    return dateStr; // إذا ما قدر يحوله يرجعه زي ما هو
  }
}
