import '../model/habit_model.dart';

abstract class HabitDatabase {
  Future<List<HabitModel>> getHabits();

  Future<int> add(HabitModel habit);

  Future<int> remove(int id);

  Future<int> update(HabitModel habit);
}
