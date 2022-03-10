import 'package:habits/data/db/habit_db_impl.dart';
import 'package:habits/data/mapper/habit_mapper.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/repository/db_repository.dart';
import 'package:habits/domain/repository/get_times_a_week_repository.dart';
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
        if (element.days.last.millisecondsSinceEpoch <
                _now.millisecondsSinceEpoch ||
            element.days.first.millisecondsSinceEpoch >
                _now.millisecondsSinceEpoch) {
          final _newElement = element.copyWith(
            weekDaysName: element.selectedDays.isEmpty
                ? element.weekDaysName
                : getIt
                    .get<DateController>()
                    .chooseDates(element.selectedDays.length)
                    .value3,
            days: element.selectedDays.isEmpty
                ? element.days
                : getIt
                    .get<DateController>()
                    .chooseDates(element.selectedDays.length)
                    .value1,
            selectedDays: element.selectedDays.isEmpty
                ? element.selectedDays
                : getIt
                    .get<DateController>()
                    .chooseDates(element.selectedDays.length)
                    .value2,
          );
          await getIt.get<DbController>().update(_newElement);
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
