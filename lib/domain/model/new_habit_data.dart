import 'package:flutter/material.dart';
import 'package:habits/presentation/theme/auxilary_color.dart';

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
