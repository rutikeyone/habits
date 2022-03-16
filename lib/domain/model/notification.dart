import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notice.dart';

class Notification {
  Notice notice;
  DateTime date;
  Time time;

  Notification({required this.notice, required this.date, required this.time});
}
