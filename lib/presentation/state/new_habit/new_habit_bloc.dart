import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/internal/date_di/date_controller.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/get_times_a_week_di/get_times_a_week_controller.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';
import 'package:habits/presentation/state/new_habit/new_habit_state.dart';
import 'package:habits/presentation/theme/auxilary_color.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc({
    required NewHabitState initialState,
  }) : super(initialState) {
    String? title;
    Color unselectedColor = unselectedRed;
    Color selectedColor = selectedRed;
    int frequencyCounter = 0;

    on(
      (event, emit) async {
        if (event is TitleChangedEvent) {
          title = event.value;
        }

        if (event is ColorChangedEvent) {
          unselectedColor = event.unselectedColor;
          selectedColor = event.selectedColor;
        }

        if (event is FrequencyCounterChangedEvent) {
          frequencyCounter = event.value;
        }

        if (event is AddEvent) {
          List<DateTime>? _nextSevenDays;
          List<DateTime>? _selectedDays;
          List<String>? _nextSevenDaysName;

          if (frequencyCounter != 0) {
            _nextSevenDays = getIt.get<DateController>().getNextSevenDays();
            _selectedDays = getIt
                .get<DateController>()
                .getSelectedDays(_nextSevenDays, frequencyCounter);
            _nextSevenDaysName = getIt
                .get<DateController>()
                .getNextSevenDaysName(_nextSevenDays);
          }

          final habit = Habit(
            title: title!,
            unselectedColorValue: unselectedColor.value,
            selectedColorValue: selectedColor.value,
            completedDays: [],
            timesAWeek: getIt.get<GetTimesAWeekController>().getTimesAWeek(
                frequencyCounter: frequencyCounter, context: event.context),
            weekDaysName: _nextSevenDaysName ?? [],
            days: _nextSevenDays ?? [],
            selectedDays: _selectedDays ?? [],
          );
          await getIt.get<DbController>().add(habit);
        }

        if (event is ErrorEvent) {
          emit(NewHabitErrorState());
        }
      },
    );
  }
}
