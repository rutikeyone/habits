import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/presentation/navigation/route.dart';
import 'package:habits/presentation/state/main/main_bloc.dart';
import 'package:habits/presentation/state/main/main_event.dart';

class MainWidgetModel extends ChangeNotifier {
  void habitItemOnPressed() {}

  void onSelectCompletedDay({
    required BuildContext context,
    required Habit habit,
    required DateTime date,
  }) {
    BlocProvider.of<MainBloc>(context).add(
      CompletedDate(
        habit: habit,
        completedDate: date,
      ),
    );
  }

  void onSelectUncompletedDay({
    required BuildContext context,
    required Habit habit,
    required DateTime date,
  }) {
    BlocProvider.of<MainBloc>(context).add(
      UncompletedDate(
        habit: habit,
        completedDate: date,
      ),
    );
  }

  void settingsOnPressed(BuildContext context) {
    Navigator.pushNamed(context, getIt.get<Settings>().route);
  }

  void newHabitOnPressed(BuildContext context) {
    Navigator.pushNamed(context, getIt.get<NewHabit>().route).then(
      (value) => BlocProvider.of<MainBloc>(context).add(
        InitialEvent(),
      ),
    );
  }

  void sortByTitle(BuildContext context) {
    BlocProvider.of<MainBloc>(context).add(
      SortByTitle(),
    );
  }

  void sortByFrequency(BuildContext context) {
    BlocProvider.of<MainBloc>(context).add(
      SortByFrequency(),
    );
  }

  void sortByCompletedDays(BuildContext context) {
    BlocProvider.of<MainBloc>(context).add(
      SortByCompletedDays(),
    );
  }
}
