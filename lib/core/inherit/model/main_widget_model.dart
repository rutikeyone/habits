import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habits/core/BLoC/bloc/main/main_bloc.dart';
import 'package:habits/core/BLoC/bloc/main/main_event.dart';
import 'package:habits/core/domain/model/habit.dart';
import 'package:habits/core/internal/locator.dart';
import 'package:habits/presentation/navigation/route.dart';
import '../../../generated/l10n.dart';
import '../../../presentation/main/components/notify_modal_bottom_sheet.dart';
import 'package:intl/intl.dart';

class MainWidgetModel extends ChangeNotifier {
  final DateFormat formatter = DateFormat('dd.LL');

  void habitItemOnPressed(BuildContext context, Habit habit) {
    Navigator.of(context)
        .pushNamed(getIt.get<Details>().route, arguments: habit)
        .then(
          (value) => BlocProvider.of<MainBloc>(context).add(
            InitialEvent(),
          ),
        );
    ;
  }

  void onSelectDay(
      {required Habit habit,
      required BuildContext context,
      required int index}) {
    final DateTime _todayDay = DateTime.now();
    final difference = _todayDay.difference(habit.days[index]).inMinutes;

    if (difference >= 0) {
      if (habit.selectedDays.contains(habit.days[index])) {
        _onSelectCompletedDay(
            context: context, habit: habit, date: habit.days[index]);
        showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).primaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          builder: (context) => showNotifyModalBottomSheet(
              context: context,
              title: formatter.format(habit.days[index]),
              text: S.of(context).done_2,
              icon: SvgPicture.asset(
                "assets/icons/success_icon.svg",
                color: Theme.of(context).textTheme.headline1!.color,
                width: 72,
                height: 72,
              ),
              closeOnPreseed: () => Navigator.of(context).pop()),
        );
      } else if (habit.completedDays.contains(habit.days[index])) {
        _onSelectUncompletedDay(
            context: context, habit: habit, date: habit.days[index]);
        showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).primaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          builder: (context) => showNotifyModalBottomSheet(
              context: context,
              title: formatter.format(habit.days[index]),
              text: S.of(context).not_completed,
              icon: SvgPicture.asset(
                "assets/icons/unsuccess_icon.svg",
                color: Theme.of(context).textTheme.headline1!.color,
                width: 72,
                height: 72,
              ),
              closeOnPreseed: () => Navigator.of(context).pop()),
        );
      }
    }
  }

  void _onSelectCompletedDay({
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

  void _onSelectUncompletedDay({
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
