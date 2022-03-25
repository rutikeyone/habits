import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/model/notice.dart';
import 'package:habits/domain/model/notification.dart' as model;
import 'package:habits/internal/date_di/date_controller.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/get_times_a_week_di/get_times_a_week_controller.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/internal/notification_di/notification_controller.dart';
import 'package:habits/presentation/bloc/new_habit/new_habit_event.dart';
import 'package:habits/presentation/bloc/new_habit/new_habit_state.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc({
    required NewHabitState initialState,
  }) : super(initialState) {
    on(
      (event, emit) async {
        if (event is AddEvent) {
          List<DateTime>? _nextSevenDays;
          List<DateTime>? _selectedDays;
          List<String>? _nextSevenDaysName;
          final _random = Random();
          int max = 10000;
          List<model.Notification>? _notifications = [];
          Notice? _notice;
          DateTime _nowDate;
          Time? _time;

          if (event.data.frequencyCounter > 0) {
            _nextSevenDays = getIt.get<DateController>().getNextSevenDays();
            _selectedDays = getIt
                .get<DateController>()
                .getSelectedDays(_nextSevenDays, event.data.frequencyCounter);
            _nextSevenDaysName = getIt
                .get<DateController>()
                .getNextSevenDaysName(_nextSevenDays);
          }

          if (event.data.areNotificationEnabled &&
              event.data.frequencyCounter != 0) {
            _selectedDays?.forEach((element) async {
              _nowDate = DateTime(element.year, element.month, element.day);
              _time = Time(
                event.data.timeOfDay.hour,
                event.data.timeOfDay.minute,
              );
              _notice = Notice(
                id: _random.nextInt(max),
                title: event.data.title,
                body: event.data.reminderText ?? "",
              );
              _notifications.add(model.Notification(
                notice: _notice!,
                date: _nowDate,
                time: _time!,
              ));
              await getIt
                  .get<NotificationController>()
                  .showScheduledNotification(
                      notice: Notice(
                          id: _notice!.id,
                          title: _notice!.title,
                          body: _notice!.body),
                      time: _time!,
                      day: _nowDate);
            });
          }

          final habit = Habit(
            notifications: _notifications,
            countSelectedDays: event.data.frequencyCounter,
            title: event.data.title,
            unselectedColorValue: event.data.unselectedColor.value,
            selectedColorValue: event.data.selectedColor.value,
            completedDays: [],
            timesAWeek: getIt.get<GetTimesAWeekController>().getTimesAWeek(
                frequencyCounter: event.data.frequencyCounter,
                context: event.context),
            weekDaysName: _nextSevenDaysName ?? [],
            days: _nextSevenDays ?? [],
            selectedDays: _selectedDays ?? [],
            totalDays: _selectedDays ?? [],
          );

          await getIt.get<DbController>().add(habit).whenComplete(
                () => Navigator.of(event.context).pop(),
              );
        }

        if (event is ErrorEvent) {
          emit(NewHabitErrorState());
        }
      },
    );
  }
}
