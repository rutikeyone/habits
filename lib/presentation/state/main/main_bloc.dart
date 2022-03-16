import 'package:bloc/bloc.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/internal/notification_di/notification_controller.dart';
import 'package:habits/internal/update_date_di/update_completed_date_controller.dart';
import 'package:habits/internal/update_date_di/update_uncompleted_date_controller.dart';
import 'package:habits/presentation/state/main/main_event.dart';
import 'package:habits/presentation/state/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required MainState initialState,
  }) : super(initialState) {
    on<MainEvent>(
      (event, emit) async {
        final int _todayDay = DateTime.now().day;

        if (event is InitialEvent) {
          emit(LoadingState());
        }

        if (event is LoadedEvent) {
          try {
            final _habits = await getIt.get<DbController>().getAll();
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
          if (event.completedDate.day == _todayDay ||
              event.completedDate.day < _todayDay) {
            final _notification = event.habit.notifications
                ?.where((e) => e.date == event.completedDate)
                .first;

            if (_notification != null) {
              await getIt
                  .get<NotificationController>()
                  .cancelById(_notification.notice.id);
            }

            await getIt
                .get<UpdateCompletedDateController>()
                .updateCompletedDateController(
                    habit: event.habit, date: event.completedDate);
            emit(LoadingState());
          }
        }

        if (event is UncompletedDate) {
          if (event.completedDate.day == _todayDay ||
              event.completedDate.day < _todayDay) {
            final _notification = event.habit.notifications
                ?.where((e) => e.date == event.completedDate)
                .first;

            if (_notification != null) {
              await getIt
                  .get<NotificationController>()
                  .showScheduledNotification(
                      notice: _notification.notice,
                      time: _notification.time,
                      day: _notification.date);
            }

            await getIt
                .get<UpdateUncompletedDateController>()
                .updateUncompletedDateController(
                    habit: event.habit, date: event.completedDate);
            emit(LoadingState());
          }
        }

        if (event is ErrorEvent) {
          emit(ErrorState(error: event.error));
        }
      },
    );
  }
}
