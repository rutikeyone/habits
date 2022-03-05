import 'package:habits/data/repository/db_repository_impl.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/usecases/core/usecase.dart';

class RemoveHabit implements UseCase<int, int> {
  final DbRepositoryImpl dbRepositoryImpl;

  RemoveHabit({required this.dbRepositoryImpl});

  @override
  Future<int> call(int id) async {
    return await dbRepositoryImpl.remove(id);
  }
}
