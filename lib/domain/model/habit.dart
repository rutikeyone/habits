class Habit {
  int? id;
  String title;
  int unselectedColorValue;
  int selectedColorValue;
  String? timesAWeek;
  List<DateTime> days;
  List<DateTime> selectedDays;
  List<String> weekDaysName;
  List<DateTime> completedDays;

  Habit(
      {this.id,
      required this.title,
      required this.unselectedColorValue,
      required this.selectedColorValue,
      required this.timesAWeek,
      required this.weekDaysName,
      required this.days,
      required this.selectedDays,
      required this.completedDays});

  Habit copyWith(
      {int? id,
      String? title,
      int? unselectedColorValue,
      int? selectedColorValue,
      String? timesAWeek,
      List<DateTime>? days,
      List<DateTime>? selectedDays,
      List<String>? weekDaysName,
      List<DateTime>? completedDays}) {
    final _newElement = Habit(
        id: this.id,
        title: title ?? this.title,
        unselectedColorValue: unselectedColorValue ?? this.unselectedColorValue,
        selectedColorValue: selectedColorValue ?? this.selectedColorValue,
        timesAWeek: timesAWeek ?? this.timesAWeek,
        weekDaysName: weekDaysName ?? this.weekDaysName,
        days: days ?? this.days,
        selectedDays: selectedDays ?? this.selectedDays,
        completedDays: completedDays ?? this.completedDays);
    return _newElement;
  }
}
