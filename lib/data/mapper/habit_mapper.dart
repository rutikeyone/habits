import 'package:habits/data/model/habit_model.dart';
import 'package:habits/domain/model/habit.dart';

class HabitMapper {
  static Habit toHabit(HabitModel model) {
    return Habit(
      id: model.id,
      title: model.title,
      colorValue: model.colorValue,
      days: model.daysMilliSeconds
          .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
          .toList(),
      selectedDays: model.selectedDaysMilliSeconds
          .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
          .toList(),
    );
  }

  static HabitModel toHabitModel(Habit habit) {
    return HabitModel(
      id: habit.id,
      title: habit.title,
      colorValue: habit.colorValue,
      daysMilliSeconds:
          habit.days.map((e) => e.millisecondsSinceEpoch).toList(),
      selectedDaysMilliSeconds:
          habit.selectedDays.map((e) => e.millisecondsSinceEpoch).toList(),
    );
  }

  static List<Habit> toListHabit(List<HabitModel> list) {
    return list
        .map(
          (model) => Habit(
            id: model.id,
            title: model.title,
            colorValue: model.colorValue,
            days: model.daysMilliSeconds
                .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
                .toList(),
            selectedDays: model.selectedDaysMilliSeconds
                .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
                .toList(),
          ),
        )
        .toList();
  }
}
