import 'package:flutter/material.dart';
import 'package:habits/presentation/new_habit/components/color_picker_bar.dart';
import 'package:habits/presentation/new_habit/components/frequency.dart';
import 'package:habits/presentation/new_habit/components/new_habit_app_bar.dart';
import 'package:habits/presentation/new_habit/components/reminder.dart';
import 'package:habits/presentation/new_habit/components/title_input_text_field.dart';

class NewHabitLoadedView extends StatefulWidget {
  const NewHabitLoadedView({Key? key}) : super(key: key);

  @override
  State<NewHabitLoadedView> createState() => _NewHabitLoadedViewState();
}

class _NewHabitLoadedViewState extends State<NewHabitLoadedView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NewHabitAppBar(),
            const TitleInputTextField(),
            const SizedBox(height: 25),
            const ColorPickerBar(),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Frequency(),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Reminder(),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
