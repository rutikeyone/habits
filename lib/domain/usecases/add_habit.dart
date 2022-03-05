import 'package:habits/data/repository/db_repository_impl.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/usecases/core/usecase.dart';

class AddHabit implements UseCase<int, Habit> {
  final DbRepositoryImpl dbRepositoryImpl;

  AddHabit({required this.dbRepositoryImpl});

  @override
  Future<int> call(Habit habit) async {
    return await dbRepositoryImpl.add(habit);
  }
}
