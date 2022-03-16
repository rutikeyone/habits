import 'dart:convert';
import 'package:habits/data/model/notice_model.dart';

class NotificationModel {
  NoticeModel notice;

  NotificationModel({required this.notice});

  factory NotificationModel.fromMap(Map<dynamic, dynamic> json) {
    return NotificationModel(
      notice: NoticeModel.fromMap(jsonDecode(json['notice'])),
    );
  }

  Map<String, dynamic> toMap() {
    final _map = {
      "notice": jsonEncode(notice.toMap()),
    };

    return _map;
  }
}
