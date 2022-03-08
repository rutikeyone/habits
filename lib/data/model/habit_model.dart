import 'dart:convert';

class HabitModel {
  int? id;
  String title;
  int colorValue;
  List<String> weekDaysName;
  List<int> daysMilliSeconds;
  List<int> selectedDaysMilliSeconds;

  HabitModel({
    this.id,
    required this.title,
    required this.colorValue,
    required this.weekDaysName,
    required this.daysMilliSeconds,
    required this.selectedDaysMilliSeconds,
  });

  factory HabitModel.fromMap(Map<String, dynamic> json) => HabitModel(
        id: json['id'],
        title: json['title'],
        colorValue: json['colorValue'],
        weekDaysName: jsonDecode(json['weekDaysName']).cast<String>(),
        daysMilliSeconds: jsonDecode(json['daysMilliSeconds']).cast<int>(),
        selectedDaysMilliSeconds:
            jsonDecode(json['selectedDaysMilliSeconds']).cast<int>(),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'colorValue': colorValue,
      'weekDaysName': jsonEncode(weekDaysName),
      'daysMilliSeconds': jsonEncode(daysMilliSeconds),
      'selectedDaysMilliSeconds': jsonEncode(selectedDaysMilliSeconds),
    };
  }
}
