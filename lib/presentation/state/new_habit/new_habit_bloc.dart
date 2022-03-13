import 'package:bloc/bloc.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/model/new_habit_data.dart';
import 'package:habits/internal/date_di/date_controller.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/get_times_a_week_di/get_times_a_week_controller.dart';
import 'package:habits/internal/locator.dart';
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

        if (event is AddEvent) {
          List<DateTime>? _nextSevenDays;
          List<DateTime>? _selectedDays;
          List<String>? _nextSevenDaysName;

          if (_newHabitData.frequencyCounter != 0) {
            _nextSevenDays = getIt.get<DateController>().getNextSevenDays();
            _selectedDays = getIt.get<DateController>().getSelectedDays(
                _nextSevenDays, _newHabitData.frequencyCounter);
            _nextSevenDaysName = getIt
                .get<DateController>()
                .getNextSevenDaysName(_nextSevenDays);
          }

          final habit = Habit(
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

        if (event is TimePicked) {
          if (_newHabitData.timeOfDay != event.timeOfDay) {
            _newHabitData.timeOfDay = event.timeOfDay;
          }
        }

        if (event is ErrorEvent) {
          emit(NewHabitErrorState());
        }
      },
    );
  }
}
