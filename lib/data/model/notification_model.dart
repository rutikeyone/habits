import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habits/data/model/notice_model.dart';

class NotificationModel {
  NoticeModel notice;
  DateTime date;
  Time time;

  NotificationModel(
      {required this.notice, required this.date, required this.time});

  factory NotificationModel.fromMap(Map<dynamic, dynamic> json) {
    return NotificationModel(
      notice: NoticeModel.fromMap(jsonDecode(json['notice'])),
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
      time: Time(
          json['time']['hour'], json['time']['minute'], json['time']['second']),
    );
  }

  Map<String, dynamic> toMap() {
    final _map = {
      "notice": jsonEncode(notice.toMap()),
      "date": date.millisecondsSinceEpoch,
      'time': {
        'hour': time.hour,
        'minute': time.minute,
        'second': time.second,
      },
    };

    return _map;
  }
}
