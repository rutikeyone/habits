import '../model/habit.dart';

abstract class UpdateDateRepository {
  Future<void> updateDate({required Habit habit, required DateTime date});
}
