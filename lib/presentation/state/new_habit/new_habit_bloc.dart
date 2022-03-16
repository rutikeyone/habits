import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/model/new_habit_data.dart';
import 'package:habits/domain/model/notice.dart';
import 'package:habits/internal/date_di/date_controller.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/get_times_a_week_di/get_times_a_week_controller.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/internal/notification_di/notification_controller.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';
import 'package:habits/presentation/state/new_habit/new_habit_state.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc({
    required NewHabitState initialState,
  }) : super(initialState) {
    NewHabitData _newHabitData = NewHabitData();

    on(
      (event, emit) async {
        if (event is TitleChangedEvent) {
          _newHabitData.title = event.value;
        }

        if (event is ColorChangedEvent) {
          _newHabitData.unselectedColor = event.unselectedColor;
          _newHabitData.selectedColor = event.selectedColor;
        }

        if (event is FrequencyCounterChangedEvent) {
          _newHabitData.frequencyCounter = event.value;
        }

        if (event is NotificationChangedEvent) {
          _newHabitData.areNotificationEnabled = event.areNotificationEnabled;
        }

        if (event is AddEvent) {
          List<DateTime>? _nextSevenDays;
          List<DateTime>? _selectedDays;
          List<String>? _nextSevenDaysName;
          int? _notificationId;
          int max = 10000;
          Notice? _notice;
          final _random = Random();

          if (_newHabitData.frequencyCounter != 0) {
            _nextSevenDays = getIt.get<DateController>().getNextSevenDays();
            _selectedDays = getIt.get<DateController>().getSelectedDays(
                _nextSevenDays, _newHabitData.frequencyCounter);
            _nextSevenDaysName = getIt
                .get<DateController>()
                .getNextSevenDaysName(_nextSevenDays);
          }

          if (_newHabitData.areNotificationEnabled &&
              _newHabitData.frequencyCounter != 0) {
            _selectedDays?.forEach((element) async {
              _notificationId = _random.nextInt(max);
              _notice = Notice(
                id: _notificationId!,
                title: _newHabitData.title,
                body: _newHabitData.reminderText,
              );
              await getIt
                  .get<NotificationController>()
                  .showScheduledNotification(
                      notice: Notice(
                          id: _notice!.id,
                          title: _notice!.title,
                          body: _notice!.body),
                      time: Time(
                        _newHabitData.timeOfDay.hour,
                        _newHabitData.timeOfDay.minute,
                      ),
                      day: DateTime(element.year, element.month, element.day));
            });
          }

          final habit = Habit(
            notice: _notice,
            title: _newHabitData.title,
            unselectedColorValue: _newHabitData.unselectedColor.value,
            selectedColorValue: _newHabitData.selectedColor.value,
            completedDays: [],
            timesAWeek: getIt.get<GetTimesAWeekController>().getTimesAWeek(
                frequencyCounter: _newHabitData.frequencyCounter,
                context: event.context),
            weekDaysName: _nextSevenDaysName ?? [],
            days: _nextSevenDays ?? [],
            selectedDays: _selectedDays ?? [],
          );

          await getIt.get<DbController>().add(habit);
        }

        if (event is TimePickedEvent) {
          if (_newHabitData.timeOfDay != event.timeOfDay) {
            _newHabitData.timeOfDay = event.timeOfDay;
          }
        }

        if (event is ReminderTextChanged) {
          _newHabitData.reminderText = event.reminderText;
        }

        if (event is ErrorEvent) {
          emit(NewHabitErrorState());
        }
      },
    );
  }
}
