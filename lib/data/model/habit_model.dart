import 'dart:convert';

class HabitModel {
  int? id;
  String title;
  int colorValue;
  List<int> daysMilliSeconds;
  List<int> selectedDaysMilliSeconds;

  HabitModel({
    this.id,
    required this.title,
    required this.colorValue,
    required this.daysMilliSeconds,
    required this.selectedDaysMilliSeconds,
  });

  factory HabitModel.fromMap(Map<String, dynamic> json) => HabitModel(
        id: json['id'],
        title: json['title'],
        colorValue: json['colorValue'],
        daysMilliSeconds: jsonDecode(json['daysMilliSeconds']).cast<int>(),
        selectedDaysMilliSeconds:
            jsonDecode(json['selectedDaysMilliSeconds']).cast<int>(),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'colorValue': colorValue,
      'daysMilliSeconds': jsonEncode(daysMilliSeconds),
      'selectedDaysMilliSeconds': jsonEncode(selectedDaysMilliSeconds),
    };
  }
}
