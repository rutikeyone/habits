import 'package:flutter/foundation.dart';

import 'notification.dart';

class Habit {
  final int? id;
  final String title;
  final int countSelectedDays;
  final int unselectedColorValue;
  final int selectedColorValue;
  final int timesAWeek;
  final List<DateTime> days;
  final List<DateTime> selectedDays;
  final List<DateTime> totalDays;
  final List<DateTime> completedDays;
  final List<Notification>? notifications;

  const Habit({
    this.id,
    this.notifications,
    required this.title,
    required this.countSelectedDays,
    required this.unselectedColorValue,
    required this.selectedColorValue,
    required this.timesAWeek,
    required this.totalDays,
    required this.days,
    required this.selectedDays,
    required this.completedDays,
  });

  Habit copyWith({
    int? id,
    String? title,
    int? countSelectedDays,
    int? unselectedColorValue,
    int? selectedColorValue,
    int? timesAWeek,
    List<DateTime>? days,
    List<DateTime>? selectedDays,
    List<DateTime>? totalDays,
    List<DateTime>? completedDays,
    List<Notification>? notifications,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      countSelectedDays: countSelectedDays ?? this.countSelectedDays,
      unselectedColorValue: unselectedColorValue ?? this.unselectedColorValue,
      selectedColorValue: selectedColorValue ?? this.selectedColorValue,
      timesAWeek: timesAWeek ?? this.timesAWeek,
      days: days ?? this.days,
      selectedDays: selectedDays ?? this.selectedDays,
      totalDays: totalDays ?? this.totalDays,
      completedDays: completedDays ?? this.completedDays,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  bool operator ==(Object other) {
    final result = other is Habit &&
        other.id == id &&
        other.title == title &&
        other.countSelectedDays == countSelectedDays &&
        other.unselectedColorValue == unselectedColorValue &&
        other.selectedColorValue == selectedColorValue &&
        other.timesAWeek == timesAWeek &&
        listEquals(other.days, days) &&
        listEquals(other.selectedDays, selectedDays) &&
        listEquals(other.totalDays, totalDays) &&
        listEquals(other.completedDays, completedDays) &&
        listEquals(other.notifications, notifications);

    if (identical(this, other)) return true;

    return false;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        countSelectedDays.hashCode ^
        unselectedColorValue.hashCode ^
        selectedColorValue.hashCode ^
        timesAWeek.hashCode ^
        days.hashCode ^
        selectedDays.hashCode ^
        totalDays.hashCode ^
        completedDays.hashCode ^
        notifications.hashCode;
  }
}
