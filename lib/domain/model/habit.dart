import 'package:flutter/material.dart';

class Habit {
  int? id;
  String title;
  int colorValue;
  String? timesAWeek;
  List<DateTime> days;
  List<DateTime> selectedDays;
  List<String> weekDaysName;

  Habit({
    this.id,
    required this.title,
    required this.colorValue,
    required this.timesAWeek,
    required this.weekDaysName,
    required this.days,
    required this.selectedDays,
  });

  Habit copyWith({
    int? id,
    String? title,
    int? colorValue,
    String? timesAWeek,
    List<DateTime>? days,
    List<DateTime>? selectedDays,
    List<String>? weekDaysName,
  }) {
    final _newElement = Habit(
      id: this.id,
      title: title ?? this.title,
      colorValue: colorValue ?? this.colorValue,
      timesAWeek: timesAWeek ?? this.timesAWeek,
      weekDaysName: weekDaysName ?? this.weekDaysName,
      days: days ?? this.days,
      selectedDays: selectedDays ?? this.selectedDays,
    );
    return _newElement;
  }
}
