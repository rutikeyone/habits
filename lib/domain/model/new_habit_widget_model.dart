import 'package:flutter/material.dart';
import 'package:habits/presentation/theme/auxilary_color.dart';

class NewHabitWidgetModel extends ChangeNotifier {
  final GlobalKey<FormState> formTitleKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formReminderKey = GlobalKey<FormState>();

  String? _title;
  Color _unselectedColor = unselectedRed;
  Color _selectedColor = selectedRed;
  int _frequencyCounter = 0;
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 0, minute: 0);
  bool _areNotificationEnabled = false;
  String? _reminderText;

  String? get title => _title;
  set title(String? val) => _title = val;

  Color get unselectedColor => _unselectedColor;
  set unselectedColor(Color color) => _unselectedColor = color;

  Color get selectedColor => _selectedColor;
  set selectedColor(Color color) => _selectedColor = color;

  int get frequencyCounter => _frequencyCounter;
  set frequencyCounter(int val) {
    _frequencyCounter = val;
    notifyListeners();
  }

  TimeOfDay get timeOfDay => _timeOfDay;
  set timeOfDay(TimeOfDay val) => _timeOfDay = val;

  bool get areNotificationEnabled => _areNotificationEnabled;
  set areNotificationEnabled(bool val) {
    _areNotificationEnabled = val;
    notifyListeners();
  }

  String? get reminderText => _reminderText;
  set reminderText(String? val) => _reminderText = val;

  final void Function(BuildContext context) onBackPressed;
  final void Function(BuildContext context) onDonePressed;
//  final void Function(String value, BuildContext context) onTitleChanged;
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
    //   required this.onTitleChanged,
    required this.onColorChanged,
    required this.frequencyCounterChanged,
    required this.onNotificationChanged,
    required this.onTimeChanged,
    required this.onReminderTextChanged,
  });
}
