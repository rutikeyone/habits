import 'dart:convert';

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
  int? notificationId;

  HabitModel(
      {this.id,
      this.notificationId,
      required this.title,
      required this.unselectedColorValue,
      required this.selectedColorValue,
      required this.timesAWeek,
      required this.weekDaysName,
      required this.daysMilliSeconds,
      required this.selectedDaysMilliSeconds,
      required this.completedDaysMilliSeconds});

  factory HabitModel.fromMap(Map<String, dynamic> json) => HabitModel(
        id: json['id'],
        notificationId: json['notificationId'],
        title: json['title'],
        unselectedColorValue: json['unselectedColorValue'],
        selectedColorValue: json['selectedColorValue'],
        timesAWeek: json['timesAWeek'],
        weekDaysName: jsonDecode(json['weekDaysName']).cast<String>(),
        daysMilliSeconds: jsonDecode(json['daysMilliSeconds']).cast<int>(),
        selectedDaysMilliSeconds:
            jsonDecode(json['selectedDaysMilliSeconds']).cast<int>(),
        completedDaysMilliSeconds:
            jsonDecode(json['completedDaysMilliSeconds']).cast<int>(),
      );

  Map<String, dynamic> toMap() {
    return {
      'notificationId': notificationId,
      'title': title,
      'unselectedColorValue': unselectedColorValue,
      'selectedColorValue': selectedColorValue,
      'timesAWeek': timesAWeek,
      'weekDaysName': jsonEncode(weekDaysName),
      'daysMilliSeconds': jsonEncode(daysMilliSeconds),
      'selectedDaysMilliSeconds': jsonEncode(selectedDaysMilliSeconds),
      'completedDaysMilliSeconds': jsonEncode(completedDaysMilliSeconds),
    };
  }
}
