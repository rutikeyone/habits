import 'package:habits/data/db/habit_db_impl.dart';
import 'package:habits/data/mapper/habit_mapper.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/repository/db_repository.dart';
import 'package:habits/internal/date_di/date_controller.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/locator.dart';

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
    HabitMapper.toListHabit(await habitDb.getHabits()).forEach(
      (element) async {
        final _now = DateTime.now();
        if (element.days.isNotEmpty) {
          if (element.days.last.millisecondsSinceEpoch <
                  _now.millisecondsSinceEpoch ||
              element.days.first.millisecondsSinceEpoch >
                  _now.millisecondsSinceEpoch) {
            List<DateTime>? _nextSevenDays;
            List<DateTime>? _selectedDays;
            List<String>? _nextSevenDaysName;

            if (element.selectedDays.isNotEmpty) {
              _nextSevenDays = getIt.get<DateController>().getNextSevenDays();
              _selectedDays = getIt
                  .get<DateController>()
                  .getSelectedDays(_nextSevenDays, element.selectedDays.length);
              _nextSevenDaysName = getIt
                  .get<DateController>()
                  .getNextSevenDaysName(_nextSevenDays);
            }

            final _newElement = element.copyWith(
              weekDaysName: _nextSevenDaysName ?? element.weekDaysName,
              days: _nextSevenDays ?? element.days,
              selectedDays: _selectedDays ?? element.selectedDays,
            );
            await getIt.get<DbController>().update(_newElement);
          }
        }
      },
    );
    final habits = HabitMapper.toListHabit(await habitDb.getHabits());
    return habits;
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
}
