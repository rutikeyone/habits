import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../../generated/l10n.dart';
import '../../../domain/model/habit.dart';
import '../../../domain/model/notice.dart';
import '../../../domain/model/notification.dart' as model;
import '../../../internal/date_di/date_controller.dart';
import '../../../internal/db_di/db_controller.dart';
import '../../../internal/locator.dart';
import '../../../internal/notification_di/notification_controller.dart';
import 'new_habit_event.dart';
import 'new_habit_state.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc({
    required NewHabitState initialState,
  }) : super(initialState) {
    on(
      (event, emit) async {
        if (event is AddEvent) {
          List<DateTime>? _nextSevenDays;
          List<DateTime>? _selectedDays;
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
            timesAWeek: event.data.frequencyCounter,
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
