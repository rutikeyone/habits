import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habits/data/repository/date_repository_impl.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/frequency_di/date_controller.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/presentation/new_habit/components/frequency.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';
import 'package:habits/presentation/state/new_habit/new_habit_state.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc({
    required NewHabitState initialState,
  }) : super(initialState) {
    String? title;
    Color? color;
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
              days: frequencyCounter == 0
                  ? []
                  : getIt.get<DateController>().getSevenDays(),
              selectedDays: frequencyCounter == 0
                  ? []
                  : getIt.get<DateController>().chooseDates(frequencyCounter));
          await getIt.get<DbController>().add(habit);
        }

        if (event is ErrorEvent) {
          emit(NewHabitErrorState());
        }
      },
    );
  }
}
