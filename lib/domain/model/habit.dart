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
    final _newTotalDays = this.totalDays;

    if (selectedDays != null) {
      _newTotalDays.addAll(selectedDays);
    }

    final _newElement = Habit(
        id: this.id,
        notifications: notifications,
        totalDays: _newTotalDays,
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
}
