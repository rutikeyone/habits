import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/internal/date_di/date_controller.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';
import 'package:habits/presentation/state/new_habit/new_habit_state.dart';
import 'package:habits/presentation/theme/auxilary_color.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc({
    required NewHabitState initialState,
  }) : super(initialState) {
    String? title;
    Color? color = red;
    int frequencyCounter = 0;

    on(
      (event, emit) async {
        if (event is TitleChangedEvent) {
          title = event.value;
        }

        if (event is ColorChangedEvent) {
          color = event.color;
        }

        if (event is FrequencyCounterChangedEvent) {
          frequencyCounter = event.value;
        }

        if (event is AddEvent) {
          final habit = Habit(
              title: title!,
              colorValue: color!.value,
              weekDaysName: frequencyCounter == 0
                  ? []
                  : getIt
                      .get<DateController>()
                      .chooseDates(frequencyCounter)
                      .value3,
              days: frequencyCounter == 0
                  ? []
                  : getIt
                      .get<DateController>()
                      .chooseDates(frequencyCounter)
                      .value1,
              selectedDays: frequencyCounter == 0
                  ? []
                  : getIt
                      .get<DateController>()
                      .chooseDates(frequencyCounter)
                      .value2);
          await getIt.get<DbController>().add(habit);
        }

        if (event is ErrorEvent) {
          emit(NewHabitErrorState());
        }
      },
    );
  }
}
