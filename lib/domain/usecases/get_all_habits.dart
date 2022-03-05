import 'package:dartz/dartz.dart';
import 'package:habits/data/repository/db_repository_impl.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/usecases/core/usecase.dart';

class GetAllHabits implements UseCase<List<Habit>, void> {
  final DbRepositoryImpl dbRepositoryImpl;

  GetAllHabits({required this.dbRepositoryImpl});

  @override
  Future<List<Habit>> call(void params) async {
    return await dbRepositoryImpl.getHabits();
  }
}
