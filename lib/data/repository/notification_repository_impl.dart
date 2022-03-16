import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:habits/domain/model/notice.dart';
import 'package:habits/domain/repository/notification_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tl;
import 'package:timezone/timezone.dart' as tz;

class NotificationRepositoryImpl extends NotificationRepository {
  final _notification = FlutterLocalNotificationsPlugin();
  final onNotification = BehaviorSubject<String?>();

  @override
  Future init({bool iniScheluted = false}) async {
    const _androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const _iOSSettings = IOSInitializationSettings();
    const _settings =
        InitializationSettings(android: _androidSettings, iOS: _iOSSettings);
    final _details = await _notification.getNotificationAppLaunchDetails();

    tl.initializeTimeZones();
    if (_details != null && _details.didNotificationLaunchApp) {
      onNotification.add(_details.payload);
    }
    if (iniScheluted) {
      final _locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(_locationName));
    }

    await _notification.initialize(
      _settings,
      onSelectNotification: (payload) async {
        onNotification.add(payload);
      },
    );
  }

  @override
  Future<void> showScheduledNotification(
      {required Notice notice,
      required Time time,
      required DateTime day}) async {
    final _locationName = await FlutterNativeTimezone.getLocalTimezone();
    final _location = tz.getLocation(_locationName);

    final _time = tz.TZDateTime(
      _location,
      day.year,
      day.month,
      day.day,
      time.hour,
      time.minute,
      time.second,
    );

    await _notification.zonedSchedule(
      notice.id,
      notice.title,
      notice.body,
      _time,
      _notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'id',
        'name',
        channelDescription: 'description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  @override
  Future<void> showNotification(Notice notice) async => _notification.show(
        notice.id,
        notice.title,
        notice.body,
        _notificationDetails(),
      );
}
