import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';
import 'package:habits/presentation/state/new_habit/new_habit_state.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc({
    required NewHabitState initialState,
  }) : super(initialState) {
    String? title;
    Color? color;

    on(
      (event, emit) async {
        if (event is TitleChangedEvent) {
          title = event.value;
        }

        if (event is ColorChangedEvent) {
          color = event.color;
        }

        if (event is AddEvent) {
          final habit = Habit(title: title!, colorValue: color!.value);
          await getIt.get<DbController>().add(habit);
        }

        if (event is ErrorEvent) {
          emit(NewHabitErrorState());
        }
      },
    );
  }
}
