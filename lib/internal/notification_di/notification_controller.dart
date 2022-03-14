import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habits/domain/model/notice.dart';
import 'package:habits/domain/repository/notification_repository.dart';
import 'package:habits/internal/locator.dart';

class NotificationController {
  Future<void> init({bool iniScheluted = false}) async {
    return getIt.get<NotificationRepository>().init(iniScheluted: iniScheluted);
  }

  Future<void> showNotification(Notice notice) async {
    return await getIt.get<NotificationRepository>().showNotification(notice);
  }

  Future<void> showScheduledNotification(
      {required Notice notice,
      required Time time,
      required DateTime day}) async {
    return getIt
        .get<NotificationRepository>()
        .showScheduledNotification(notice: notice, time: time, day: day);
  }
}
