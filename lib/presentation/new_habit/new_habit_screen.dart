import 'package:flutter/material.dart';
import 'package:habits/presentation/new_habit/view/new_habit_loaded_view.dart';

class NewHabitScreen extends StatelessWidget {
  const NewHabitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: NewHabitLoadedView());
  }
}
