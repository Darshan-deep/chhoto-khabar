import 'package:intl/intl.dart';



// Format time string like "14:30" to "2:30 PM"
String formatTimeForDisplay(String? timeString) {
  if (timeString == null || timeString.isEmpty) {
    return 'Unknown';
  }
  final parts = timeString.split(':');
  if (parts.length < 2) return timeString;

  int hour = int.tryParse(parts[0]) ?? 0;
  String minute = parts[1];

  String period = hour < 12 ? 'AM' : 'PM';
  if (hour > 12) {
    hour -= 12;
  } else if (hour == 0) {
    hour = 12;
  }

  return '$hour:$minute $period';
}

String getAppointMentTime(String startTime, String? endTime) {
  if (endTime == null) {
    return startTime;
  }
  return "$startTime - $endTime";
}

String formatTimeFromIsoString(String? isoString) {
  if (isoString == null || isoString.isEmpty) {
    return 'Unknown';
  }

  try {
    DateTime dateTime = DateTime.parse(isoString).toLocal(); // ensure local time
    DateTime now = DateTime.now();

    String formattedTime = DateFormat('h:mm a').format(dateTime); // e.g., 1:53 PM

    bool isToday = dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;

    if (isToday) {
      return formattedTime;
    } else {
      String formattedDate = DateFormat('MMMM d').format(dateTime); // e.g., July 13
      return '$formattedTime $formattedDate';
    }
  } catch (e) {
    return 'Invalid date format';
  }
}
