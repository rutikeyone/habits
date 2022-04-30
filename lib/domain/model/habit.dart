import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'notification.dart';

class Habit {
  int? id;
  String title;
  int countSelectedDays;
  int unselectedColorValue;
  int selectedColorValue;
  String? timesAWeek;
  List<DateTime> days;
  List<DateTime> selectedDays;
  List<String> weekDaysName;
  List<DateTime> totalDays;
  List<DateTime> completedDays;
  List<Notification>? notifications;

  Habit({
    this.id,
    this.notifications,
    required this.title,
    required this.countSelectedDays,
    required this.unselectedColorValue,
    required this.selectedColorValue,
    required this.timesAWeek,
    required this.totalDays,
    required this.weekDaysName,
    required this.days,
    required this.selectedDays,
    required this.completedDays,
  });

  Habit copyWith(
      {int? id,
      List<Notification>? notifications,
      String? title,
      int? unselectedColorValue,
      int? selectedColorValue,
      int? countSelectedDays,
      String? timesAWeek,
      List<DateTime>? days,
      List<DateTime>? totalDays,
      List<DateTime>? selectedDays,
      List<String>? weekDaysName,
      List<DateTime>? completedDays}) {
    final _newElement = Habit(
        id: this.id,
        notifications: notifications,
        totalDays: totalDays ?? this.totalDays,
        title: title ?? this.title,
        unselectedColorValue: unselectedColorValue ?? this.unselectedColorValue,
        selectedColorValue: selectedColorValue ?? this.selectedColorValue,
        timesAWeek: timesAWeek ?? this.timesAWeek,
        weekDaysName: weekDaysName ?? this.weekDaysName,
        days: days ?? this.days,
        selectedDays: selectedDays ?? this.selectedDays,
        countSelectedDays: countSelectedDays ?? this.countSelectedDays,
        completedDays: completedDays ?? this.completedDays);
    return _newElement;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Habit &&
        other.id == id &&
        other.title == title &&
        other.countSelectedDays == countSelectedDays &&
        other.unselectedColorValue == unselectedColorValue &&
        other.selectedColorValue == selectedColorValue &&
        other.timesAWeek == timesAWeek &&
        listEquals(other.days, days) &&
        listEquals(other.selectedDays, selectedDays) &&
        listEquals(other.weekDaysName, weekDaysName) &&
        listEquals(other.totalDays, totalDays) &&
        listEquals(other.completedDays, completedDays) &&
        listEquals(other.notifications, notifications);
  }
}
