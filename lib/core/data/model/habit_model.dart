import 'dart:convert';

import 'notification_model.dart';

class HabitModel {
  int? id;
  String title;
  int countSelectedDays;
  int unselectedColorValue;
  int selectedColorValue;
  int timesAWeek;
  List<int> daysMilliSeconds;
  List<int> selectedDaysMilliSeconds;
  List<int> totalDaysMilliSeconds;
  List<int> completedDaysMilliSeconds;
  List<NotificationModel>? notifications;

  HabitModel(
      {this.id,
      this.notifications,
      required this.title,
      required this.countSelectedDays,
      required this.unselectedColorValue,
      required this.selectedColorValue,
      required this.timesAWeek,
      required this.totalDaysMilliSeconds,
      required this.daysMilliSeconds,
      required this.selectedDaysMilliSeconds,
      required this.completedDaysMilliSeconds});

  factory HabitModel.fromMap(Map<String, dynamic> json) {
    return HabitModel(
        id: json['id'],
        countSelectedDays: json['countSelectedDays'],
        notifications: json['notifications'] != null
            ? (jsonDecode(json["notifications"]) as List)
                .map((data) => NotificationModel.fromMap(data))
                .toList()
            : null,
        title: json['title'],
        unselectedColorValue: json['unselectedColorValue'],
        selectedColorValue: json['selectedColorValue'],
        timesAWeek: int.tryParse(json['timesAWeek']) ?? 0,
        daysMilliSeconds: jsonDecode(json['daysMilliSeconds']).cast<int>(),
        selectedDaysMilliSeconds:
            jsonDecode(json['selectedDaysMilliSeconds']).cast<int>(),
        totalDaysMilliSeconds:
            jsonDecode(json['totalDaysMilliSeconds']).cast<int>(),
        completedDaysMilliSeconds:
            jsonDecode(json['completedDaysMilliSeconds']).cast<int>());
  }

  Map<String, dynamic> toMap() {
    final _map = {
      'notifications': notifications != null
          ? jsonEncode(notifications!.map((e) => e.toMap()).toList())
          : null,
      'title': title,
      'countSelectedDays': countSelectedDays,
      'unselectedColorValue': unselectedColorValue,
      'selectedColorValue': selectedColorValue,
      'timesAWeek': timesAWeek,
      'daysMilliSeconds': jsonEncode(daysMilliSeconds),
      'totalDaysMilliSeconds': jsonEncode(totalDaysMilliSeconds),
      'selectedDaysMilliSeconds': jsonEncode(selectedDaysMilliSeconds),
      'completedDaysMilliSeconds': jsonEncode(completedDaysMilliSeconds)
    };

    return _map;
  }
}
