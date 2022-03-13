import 'package:habits/domain/model/notification.dart';

abstract class NotificationRepository {
  Future init({bool iniScheluted = false});

  Future showScheduledNotification(Notice notification);
}
