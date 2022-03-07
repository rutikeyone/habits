import 'package:flutter/material.dart';

class Habit {
  int? id;
  String title;
  int colorValue;
  List<DateTime> days;
  List<DateTime> selectedDays;

  Habit({
    this.id,
    required this.title,
    required this.colorValue,
    required this.days,
    required this.selectedDays,
  });
}
