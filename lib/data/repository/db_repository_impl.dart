import 'package:habits/data/db/habit_db_impl.dart';
import 'package:habits/data/mapper/habit_mapper.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/repository/db_repository.dart';

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
