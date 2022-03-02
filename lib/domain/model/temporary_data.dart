import 'package:flutter/material.dart';

class Habit {
  final String title;
  final String frequency;
  final List<HabitDay> habitDays;

  const Habit({
    required this.title,
    required this.frequency,
    required this.habitDays,
  });
}

class HabitDay {
  final String dayWeekName;
  final int dayWeekNum;
  final Color color;

  HabitDay({
    required this.dayWeekName,
    required this.dayWeekNum,
    required this.color,
  });
}
