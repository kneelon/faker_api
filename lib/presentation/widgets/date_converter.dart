import 'package:intl/intl.dart';

String formatDateTime(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    return DateFormat('MMM d, yyyy - hh:mm a').format(dateTime);
}

String formatDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    return DateFormat('MMM d, yyyy').format(dateTime);
}