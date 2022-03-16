import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habits/domain/model/notice.dart';

abstract class NotificationRepository {
  Future<void> init({bool iniScheluted = false});

  Future<void> showNotification(Notice notice);

  Future<void> showScheduledNotification(
      {required Notice notice, required Time time, required DateTime day});

  Future<void> cancelById(int id);
}
