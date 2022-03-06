import 'package:get_it/get_it.dart';
import 'package:habits/data/db/habit_db_impl.dart';
import 'package:habits/data/repository/db_repository_impl.dart';
import 'package:habits/domain/repository/db_repository.dart';
import 'package:habits/internal/db_di/db_controller.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton<HabitDatabaseImpl>(
      () => HabitDatabaseImpl.instance);
  getIt.registerLazySingleton<DbRepository>(
    () => DbRepositoryImpl(
      habitDb: getIt.get<HabitDatabaseImpl>(),
    ),
  );
  getIt.registerLazySingleton<DbController>(() => DbController());
}
