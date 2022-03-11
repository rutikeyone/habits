import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/repository/update_date_repository.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/locator.dart';

class UpdateUncompletedDateRepositoryImpl extends UpdateDateRepository {
  @override
  Future<void> updateDate(
      {required Habit habit, required DateTime date}) async {
    final _updatedSelectedDays = habit.selectedDays;
    _updatedSelectedDays.add(date);
    final _updatedCompletedDays = habit.completedDays;
    _updatedCompletedDays.remove(date);
    await getIt.get<DbController>().update(habit.copyWith(
          completedDays: _updatedCompletedDays,
          selectedDays: _updatedSelectedDays,
        ));
  }
}
