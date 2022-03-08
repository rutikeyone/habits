import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/presentation/main/components/main_app_bar.dart';
import 'package:habits/presentation/main/components/main_bottom_app_bar.dart';
import 'package:habits/presentation/main/widgets/habit_item.dart';

class MainLoadedView extends StatelessWidget {
  final List<Habit> habits;
  const MainLoadedView({Key? key, required this.habits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Column(
        children: [
          MainAppBar(
            listOnPressed: () {},
            settingOnPressed: () {},
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: habits.length,
              itemBuilder: (builder, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: HabitItem(
                      habit: habits[index],
                      habitItemOnPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MainBottomAppBar(),
    );
  }
}
