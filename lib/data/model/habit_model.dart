import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:habits/data/model/notification_model.dart';

class HabitModel {
  int? id;
  String title;
  int unselectedColorValue;
  int selectedColorValue;
  String? timesAWeek;
  List<String> weekDaysName;
  List<int> daysMilliSeconds;
  List<int> selectedDaysMilliSeconds;
  List<int> completedDaysMilliSeconds;
  List<NotificationModel>? notifications;

  HabitModel(
      {this.id,
      this.notifications,
      required this.title,
      required this.unselectedColorValue,
      required this.selectedColorValue,
      required this.timesAWeek,
      required this.weekDaysName,
      required this.daysMilliSeconds,
      required this.selectedDaysMilliSeconds,
      required this.completedDaysMilliSeconds});

  factory HabitModel.fromMap(Map<String, dynamic> json) {
    return HabitModel(
        id: json['id'],
        notifications: json['notifications'] != null
            ? (jsonDecode(json["notifications"]) as List)
                .map((data) => NotificationModel.fromMap(data))
                .toList()
            : null,
        title: json['title'],
        unselectedColorValue: json['unselectedColorValue'],
        selectedColorValue: json['selectedColorValue'],
        timesAWeek: json['timesAWeek'],
        weekDaysName: jsonDecode(json['weekDaysName']).cast<String>(),
        daysMilliSeconds: jsonDecode(json['daysMilliSeconds']).cast<int>(),
        selectedDaysMilliSeconds:
            jsonDecode(json['selectedDaysMilliSeconds']).cast<int>(),
        completedDaysMilliSeconds:
            jsonDecode(json['completedDaysMilliSeconds']).cast<int>());
  }

  Map<String, dynamic> toMap() {
    final _map = {
      'notifications': notifications != null
          ? jsonEncode(notifications!.map((e) => e.toMap()).toList())
          : null,
      'title': title,
      'unselectedColorValue': unselectedColorValue,
      'selectedColorValue': selectedColorValue,
      'timesAWeek': timesAWeek,
      'weekDaysName': jsonEncode(weekDaysName),
      'daysMilliSeconds': jsonEncode(daysMilliSeconds),
      'selectedDaysMilliSeconds': jsonEncode(selectedDaysMilliSeconds),
      'completedDaysMilliSeconds': jsonEncode(completedDaysMilliSeconds)
    };

    return _map;
  }
}
