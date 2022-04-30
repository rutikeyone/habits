import 'package:flutter/material.dart';

class NewHabitData {
  String title;
  Color unselectedColor;
  Color selectedColor;
  int frequencyCounter;
  TimeOfDay timeOfDay;
  bool areNotificationEnabled;
  String? reminderText;

  NewHabitData(
    this.title,
    this.unselectedColor,
    this.selectedColor,
    this.frequencyCounter,
    this.timeOfDay,
    this.areNotificationEnabled,
    this.reminderText,
  );
}
