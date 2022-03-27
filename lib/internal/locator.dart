import 'package:get_it/get_it.dart';
import '../data/db/habit_db_impl.dart';
import '../data/repository/date_repository_impl.dart';
import '../data/repository/db_repository_impl.dart';
import '../data/repository/notification_repository_impl.dart';
import '../data/repository/update_completed_date_repository_impl.dart';
import '../data/repository/update_uncompleted_date_repository_impl.dart';
import '../domain/repository/date_repository.dart';
import '../domain/repository/db_repository.dart';
import '../domain/repository/notification_repository.dart';
import '../presentation/navigation/route.dart';
import 'date_di/date_controller.dart';
import 'db_di/db_controller.dart';
import 'notification_di/notification_controller.dart';
import 'update_date_di/update_completed_date_controller.dart';
import 'update_date_di/update_uncompleted_date_controller.dart';

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

  getIt.registerLazySingleton<DateRepository>(() => DateRepositoryImpl());
  getIt.registerLazySingleton<DateController>(() => DateController());

  getIt.registerLazySingleton<UpdateCompletedDateRepositoryImpl>(
      () => UpdateCompletedDateRepositoryImpl());
  getIt.registerLazySingleton<UpdateCompletedDateController>(
      () => UpdateCompletedDateController());

  getIt.registerLazySingleton<UpdateUncompletedDateRepositoryImpl>(
      () => UpdateUncompletedDateRepositoryImpl());
  getIt.registerLazySingleton<UpdateUncompletedDateController>(
      () => UpdateUncompletedDateController());

  getIt.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl());
  getIt.registerLazySingleton<NotificationController>(
      () => NotificationController());

  getIt.registerLazySingleton<Main>(() => Main());
  getIt.registerLazySingleton<Settings>(() => Settings());
  getIt.registerLazySingleton<NewHabit>(() => NewHabit());
  getIt.registerLazySingleton<Details>(() => Details());
}
