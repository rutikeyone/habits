import 'package:habits/domain/model/habit.dart';

abstract class DbRepository {
  Future<List<Habit>> getHabits();

  Future add(Habit habit);

  Future remove(int id);

  Future update(Habit habit);

  Future<void> updateDates();
}
