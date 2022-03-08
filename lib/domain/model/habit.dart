import 'package:flutter/material.dart';

class Habit {
  int? id;
  String title;
  int colorValue;
  List<DateTime> days;
  List<DateTime> selectedDays;
  List<String> weekDaysName;

  Habit({
    this.id,
    required this.title,
    required this.colorValue,
    required this.weekDaysName,
    required this.days,
    required this.selectedDays,
  });
}
