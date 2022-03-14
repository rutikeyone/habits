import 'package:get_it/get_it.dart';
import 'package:habits/data/db/habit_db_impl.dart';
import 'package:habits/data/repository/db_repository_impl.dart';
import 'package:habits/data/repository/date_repository_impl.dart';
import 'package:habits/data/repository/get_times_a_week_repository_impl.dart';
import 'package:habits/data/repository/notification_repository_impl.dart';
import 'package:habits/data/repository/update_completed_date_repository_impl.dart';
import 'package:habits/data/repository/update_uncompleted_date_repository_impl.dart';
import 'package:habits/domain/repository/db_repository.dart';
import 'package:habits/domain/repository/date_repository.dart';
import 'package:habits/domain/repository/get_times_a_week_repository.dart';
import 'package:habits/domain/repository/notification_repository.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/get_times_a_week_di/get_times_a_week_controller.dart';
import 'package:habits/internal/notification_di/notification_controller.dart';
import 'package:habits/internal/update_date_di/update_completed_date_controller.dart';

import 'date_di/date_controller.dart';
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

  getIt.registerLazySingleton<GetTimesAWeekRepository>(
      () => GetTimesAWeekRepositoryImpl());
  getIt.registerLazySingleton<GetTimesAWeekController>(
      () => GetTimesAWeekController());

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
}
