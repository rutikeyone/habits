import 'package:flutter/material.dart';
import 'package:habits/presentation/new_habit/components/new_habit_app_bar.dart';

class NewHabitLoadedView extends StatelessWidget {
  const NewHabitLoadedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Column(
        children: [
          NewHabitAppBar(
            cancelOnPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
