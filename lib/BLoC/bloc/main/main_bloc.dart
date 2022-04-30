import 'package:bloc/bloc.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/internal/notification_di/notification_controller.dart';
import 'package:habits/internal/update_date_di/update_completed_date_controller.dart';
import 'package:habits/internal/update_date_di/update_uncompleted_date_controller.dart';
import '../../../internal/db_di/db_controller.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required MainState initialState,
  }) : super(initialState) {
    on<MainEvent>(
      (event, emit) async {
        if (event is InitialEvent) {
          emit(LoadingState());
        }

        if (event is OnResume) {
          emit(LoadingState());
        }

        if (event is LoadedEvent) {
          try {
            await getIt.get<DbController>().updateDates();
            final _habits = await getIt.get<DbController>().getAll();
            if (event.compareTo != null) {
              _habits.sort(event.compareTo);
            }
            emit(LoadedState(
              habits: _habits,
            ));
          } catch (e) {
            emit(
              ErrorState(
                error: e.toString(),
              ),
            );
          }
        }

        if (event is CompletedDate) {
          if (event.habit.notifications != null) {
            if (event.habit.notifications!.isNotEmpty) {
              final _notification = event.habit.notifications?.firstWhere(
                  (element) => element.date.day == event.completedDate.day);

              if (_notification != null) {
                await getIt
                    .get<NotificationController>()
                    .cancelById(_notification.notice.id);
              }
            }

            await getIt
                .get<UpdateCompletedDateController>()
                .updateCompletedDateController(
                    habit: event.habit, date: event.completedDate);

            final _habits = await getIt.get<DbController>().getAll();

            emit(LoadedState(habits: _habits));
          }
        }

        if (event is UncompletedDate) {
          if (event.habit.notifications != null) {
            if (event.habit.notifications!.isNotEmpty) {
              final _notification = event.habit.notifications?.first;

              if (_notification != null) {
                await getIt
                    .get<NotificationController>()
                    .showScheduledNotification(
                        notice: _notification.notice,
                        time: _notification.time,
                        day: event.completedDate);
              }
            }

            await getIt
                .get<UpdateUncompletedDateController>()
                .updateUncompletedDateController(
                    habit: event.habit, date: event.completedDate);
            final _habits = await getIt.get<DbController>().getAll();

            emit(LoadedState(habits: _habits));
          }
        }

        if (event is SortByTitle) {
          emit(LoadingState(compareTo: (a, b) => a.title.compareTo(b.title)));
        }

        if (event is SortByFrequency) {
          emit(LoadingState(
              compareTo: (a, b) =>
                  b.countSelectedDays.compareTo(a.countSelectedDays)));
        }

        if (event is SortByCompletedDays) {
          emit(LoadingState(
              compareTo: (a, b) =>
                  b.completedDays.length.compareTo(a.completedDays.length)));
        }

        if (event is ErrorEvent) {
          emit(ErrorState(error: event.error));
        }
      },
    );
  }
}
