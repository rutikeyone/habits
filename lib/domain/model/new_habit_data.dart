import 'package:flutter/material.dart';
import 'package:habits/presentation/theme/auxilary_color.dart';

class NewHabitData {
  late String _title;
  late Color _unselectedColor;
  late Color _selectedColor;
  late int _frequencyCounter;
  late TimeOfDay _timeOfDay;

  String get title => _title;
  set title(String val) => _title = val;

  Color get unselectedColor => _unselectedColor;
  set unselectedColor(Color color) => _unselectedColor = color;

  Color get selectedColor => _selectedColor;
  set selectedColor(Color color) => _selectedColor = color;

  int get frequencyCounter => _frequencyCounter;
  set frequencyCounter(int val) => _frequencyCounter = val;

  TimeOfDay get timeOfDay => _timeOfDay;
  set timeOfDay(TimeOfDay val) => _timeOfDay = val;

  NewHabitData() {
    _title = "";
    _unselectedColor = unselectedRed;
    _selectedColor = selectedRed;
    _frequencyCounter = 0;
    _timeOfDay = const TimeOfDay(hour: 0, minute: 0);
  }
}
