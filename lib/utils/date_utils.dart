import 'package:intl/intl.dart';

class DateConverter {
  /// Converts a UTC timestamp string to a formatted date-time string
  /// based on the user's local device time zone.
  static String formatToLocalTime(String utcTimestamp) {
    try {
      // Parse the UTC timestamp
      DateTime utcDateTime = DateTime.parse(utcTimestamp);

      // Convert to the user's local time zone
      DateTime localDateTime = utcDateTime.toLocal();

      // Format the date and time
      return DateFormat('MMMM d, yyyy, h:mm a').format(localDateTime);
    } catch (e) {
      // Return a fallback message in case of an error
      return "Invalid date";
    }
  }
}
