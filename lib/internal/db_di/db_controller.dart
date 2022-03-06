import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/repository/db_repository.dart';
import 'package:habits/internal/locator.dart';

class DbController {
  Future<int> add(Habit habit) async {
    return await getIt.get<DbRepository>().add(habit);
  }

  Future<List<Habit>> getAll() async {
    return await getIt.get<DbRepository>().getHabits();
  }

  Future<int> update(Habit habit) async {
    return await getIt.get<DbRepository>().update(habit);
  }

  Future<int> remove(int id) async {
    return await getIt.get<DbRepository>().remove(id);
  }
}
