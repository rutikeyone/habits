import 'package:habits/data/model/habit_model.dart';
import 'package:habits/data/model/notice_model.dart';
import 'package:habits/data/model/notification_model.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/model/notice.dart';
import 'package:habits/domain/model/notification.dart';

class HabitMapper {
  static Habit toHabit(HabitModel model) {
    return Habit(
      id: model.id,
      notification: model.notification != null
          ? Notification(
              notice: Notice(
                  id: model.notification!.notice.id,
                  title: model.notification!.notice.title,
                  body: model.notification!.notice.body),
            )
          : null,
      title: model.title,
      selectedColorValue: model.selectedColorValue,
      unselectedColorValue: model.selectedColorValue,
      timesAWeek: model.timesAWeek,
      weekDaysName: model.weekDaysName,
      days: model.daysMilliSeconds
          .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
          .toList(),
      selectedDays: model.selectedDaysMilliSeconds
          .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
          .toList(),
      completedDays: model.completedDaysMilliSeconds
          .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
          .toList(),
    );
  }

  static HabitModel toHabitModel(Habit habit) {
    return HabitModel(
      id: habit.id,
      title: habit.title,
      notification: habit.notification != null
          ? NotificationModel(
              notice: NoticeModel(
                id: habit.notification!.notice.id,
                title: habit.notification!.notice.title,
                body: habit.notification!.notice.body,
              ),
            )
          : null,
      weekDaysName: habit.weekDaysName,
      timesAWeek: habit.timesAWeek,
      unselectedColorValue: habit.unselectedColorValue,
      selectedColorValue: habit.selectedColorValue,
      daysMilliSeconds:
          habit.days.map((e) => e.millisecondsSinceEpoch).toList(),
      selectedDaysMilliSeconds:
          habit.selectedDays.map((e) => e.millisecondsSinceEpoch).toList(),
      completedDaysMilliSeconds:
          habit.completedDays.map((e) => e.millisecondsSinceEpoch).toList(),
    );
  }

  static List<Habit> toListHabit(List<HabitModel> list) {
    return list
        .map(
          (model) => Habit(
            id: model.id,
            notification: model.notification != null
                ? Notification(
                    notice: Notice(
                        id: model.notification!.notice.id,
                        title: model.notification!.notice.title,
                        body: model.notification!.notice.body),
                  )
                : null,
            title: model.title,
            unselectedColorValue: model.unselectedColorValue,
            selectedColorValue: model.selectedColorValue,
            timesAWeek: model.timesAWeek,
            weekDaysName: model.weekDaysName,
            days: model.daysMilliSeconds
                .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
                .toList(),
            selectedDays: model.selectedDaysMilliSeconds
                .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
                .toList(),
            completedDays: model.completedDaysMilliSeconds
                .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
                .toList(),
          ),
        )
        .toList();
  }
}
