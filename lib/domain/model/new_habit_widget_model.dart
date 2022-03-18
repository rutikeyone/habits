import 'package:flutter/material.dart';

class NewHabitWidgetModel extends ChangeNotifier {
  final void Function(BuildContext context) onBackPressed;
  final void Function(BuildContext context) onDonePressed;
  final void Function(String value, BuildContext context) onTitleChanged;
  final void Function({
    required BuildContext context,
    required Color unselectedColor,
    required Color selectedColor,
  }) onColorChanged;
  final void Function(int value, BuildContext context) frequencyCounterChanged;
  final void Function(bool areNotificationEnabled, BuildContext context)
      onNotificationChanged;
  final void Function(TimeOfDay timeOfDay, BuildContext context) onTimeChanged;
  final void Function(String value, BuildContext context) onReminderTextChanged;

  NewHabitWidgetModel({
    required this.onBackPressed,
    required this.onDonePressed,
    required this.onTitleChanged,
    required this.onColorChanged,
    required this.frequencyCounterChanged,
    required this.onNotificationChanged,
    required this.onTimeChanged,
    required this.onReminderTextChanged,
  });
}
