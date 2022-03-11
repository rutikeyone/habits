import 'package:habits/data/repository/update_completed_date_repository_impl.dart';
import 'package:habits/domain/model/habit.dart';

import '../locator.dart';

class UpdateCompletedDateController {
  Future<void> updateCompletedDateController(
      {required Habit habit, required DateTime date}) async {
    return await getIt
        .get<UpdateCompletedDateRepositoryImpl>()
        .updateDate(habit: habit, date: date);
  }
}
