import '../../domain/model/habit.dart';
import '../../domain/repository/db_repository.dart';
import '../locator.dart';

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

  Future<void> updateDates() async {
    return await getIt.get<DbRepository>().updateDates();
  }
}
