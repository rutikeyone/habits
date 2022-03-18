import 'package:flutter/cupertino.dart';
import 'package:habits/domain/model/habit.dart';

class MainWidgetModel extends ChangeNotifier {
  final VoidCallback habitItemOnPressed;
  final void Function({
    required BuildContext context,
    required Habit habit,
    required DateTime date,
  }) onSelectCompletedDay;
  final void Function({
    required BuildContext context,
    required Habit habit,
    required DateTime date,
  }) onSelectUnCompletedDay;
  final Function(BuildContext context) settingsOnPressed;
  final Function(BuildContext context) newHabitOnPressed;

  MainWidgetModel({
    required this.habitItemOnPressed,
    required this.onSelectCompletedDay,
    required this.onSelectUnCompletedDay,
    required this.settingsOnPressed,
    required this.newHabitOnPressed,
  });
}
