// Format timestamp to show just time for today, or date and time for older messages
String formatTimestamp(String? isoTimestamp) {
  if (isoTimestamp == null || isoTimestamp.isEmpty) {
    return 'Now';
  }

  try {
    final dateTime = DateTime.parse(isoTimestamp);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    // Format the time part (used in all cases)
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final formattedTime = '$hour:$minute';

    // If message is from today, show only time
    if (messageDate == today) {
      return formattedTime;
    }

    // If message is from this year, show day, month and time
    if (dateTime.year == now.year) {
      // Get month name
      const monthNames = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      final monthName = monthNames[dateTime.month - 1];

      // Format: "15 May 02:42"
      return '${dateTime.day} $monthName $formattedTime';
    }

    // For previous years, include the year
    const monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final monthName = monthNames[dateTime.month - 1];

    // Format: "15 May 2024 02:42"
    return '${dateTime.day} $monthName ${dateTime.year} $formattedTime';
  } catch (e) {
    return 'Now';
  }
}
