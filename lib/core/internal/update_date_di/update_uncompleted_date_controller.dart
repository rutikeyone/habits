import '../../data/repository/update_uncompleted_date_repository_impl.dart';
import '../../domain/model/habit.dart';
import '../locator.dart';

class UpdateUncompletedDateController {
  Future<void> updateUncompletedDateController(
      {required Habit habit, required DateTime date}) async {
    return await getIt
        .get<UpdateUncompletedDateRepositoryImpl>()
        .updateDate(habit: habit, date: date);
  }
}
