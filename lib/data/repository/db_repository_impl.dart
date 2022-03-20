import 'package:habits/data/db/habit_db_impl.dart';
import 'package:habits/data/mapper/habit_mapper.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/model/notification.dart';
import 'package:habits/domain/repository/db_repository.dart';
import 'package:habits/internal/date_di/date_controller.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/internal/notification_di/notification_controller.dart';

class DbRepositoryImpl extends DbRepository {
  HabitDatabaseImpl habitDb;

  DbRepositoryImpl({required this.habitDb});

  @override
  Future add(Habit habit) {
    final model = HabitMapper.toHabitModel(habit);
    return habitDb.add(model);
  }

  @override
  Future<List<Habit>> getHabits() async {
    final _habitsModel = await habitDb.getHabits();
    final _habits = HabitMapper.toListHabit(_habitsModel);

    return _habits;
  }

  @override
  Future remove(int id) {
    return habitDb.remove(id);
  }

  @override
  Future<int> update(Habit habit) {
    final model = HabitMapper.toHabitModel(habit);
    return habitDb.update(model);
  }

  @override
  Future<void> updateDates() async {
    final _oldHabits = await getIt.get<DbController>().getAll();

    await Future.forEach(_oldHabits, (Habit element) async {
      final _now = DateTime.now();

      if (element.days.isNotEmpty &&
          (_now.difference(element.days.first).inDays >= 7 ||
              _now.difference(element.days.last).inDays <= -6)) {
        List<DateTime> _nextSevenDays =
            getIt.get<DateController>().getNextSevenDays();
        List<String> _nextSevenDaysName =
            getIt.get<DateController>().getNextSevenDaysName(_nextSevenDays);
        List<DateTime>? _selectedDays;
        List<Notification> _notifications = [];

        if (element.countSelectedDays > 0) {
          _selectedDays = getIt
              .get<DateController>()
              .getSelectedDays(_nextSevenDays, element.countSelectedDays);
        }

        if (element.notifications != null) {
          element.notifications?.forEach((element) async {
            await getIt
                .get<NotificationController>()
                .cancelById(element.notice.id);
          });
        }

        for (int i = 0;
            i <
                (element.notifications != null
                    ? element.notifications!.length
                    : 0);
            i++) {
          final _notification = element.notifications![i].copyWith(
            date: _selectedDays![i],
          );
          _notifications.add(_notification);
        }

        if (_notifications.isNotEmpty) {
          for (final item in _notifications) {
            await getIt.get<NotificationController>().showScheduledNotification(
                notice: item.notice, time: item.time, day: item.date);
          }
        }

        final _newHabit = element.copyWith(
          days: _nextSevenDays,
          weekDaysName: _nextSevenDaysName,
          selectedDays: _selectedDays,
          notifications: _notifications,
        );
        await getIt.get<DbController>().update(_newHabit);
      }
    });
  }
}
