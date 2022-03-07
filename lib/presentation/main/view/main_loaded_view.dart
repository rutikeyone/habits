import 'package:flutter/material.dart';
import 'package:habits/domain/model/temporary_data.dart';
import 'package:habits/presentation/main/components/main_app_bar.dart';
import 'package:habits/presentation/main/components/main_bottom_app_bar.dart';
import 'package:habits/presentation/main/widgets/habit_item.dart';
import 'package:habits/presentation/new_habit/new_habit_screen.dart';

class MainLoadedView extends StatelessWidget {
  final List<Habit> habits = [
    Habit(
      title: "Meditation",
      frequency: "Everyday",
      habitDays: [
        HabitDay(
          dayWeekName: "Tue",
          dayWeekNum: 15,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Mon",
          dayWeekNum: 14,
          color: const Color(0xffE76967),
        ),
        HabitDay(
          dayWeekName: "Sun",
          dayWeekNum: 13,
          color: const Color(0xffE76967),
        ),
        HabitDay(
          dayWeekName: "Sat",
          dayWeekNum: 12,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Fri",
          dayWeekNum: 11,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Thu",
          dayWeekNum: 10,
          color: const Color(0xffE76967),
        ),
      ],
    ),
    Habit(
      title: "English",
      frequency: "4 times a week",
      habitDays: [
        HabitDay(
          dayWeekName: "Tue",
          dayWeekNum: 22,
          color: const Color(0xff5762F5),
        ),
        HabitDay(
          dayWeekName: "Mon",
          dayWeekNum: 21,
          color: const Color(0xff5762F5),
        ),
        HabitDay(
          dayWeekName: "Sun",
          dayWeekNum: 20,
          color: const Color(0xff5762F5),
        ),
        HabitDay(
          dayWeekName: "Sat",
          dayWeekNum: 19,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Fri",
          dayWeekNum: 18,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Thu",
          dayWeekNum: 17,
          color: const Color(0xff333333),
        ),
      ],
    ),
    Habit(
      title: "Yoga",
      frequency: "2 times a week",
      habitDays: [
        HabitDay(
          dayWeekName: "Tue",
          dayWeekNum: 22,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Mon",
          dayWeekNum: 21,
          color: const Color(0xff23CA74),
        ),
        HabitDay(
          dayWeekName: "Sun",
          dayWeekNum: 20,
          color: const Color(0xff23CA74),
        ),
        HabitDay(
          dayWeekName: "Sat",
          dayWeekNum: 19,
          color: const Color(0xff23CA74),
        ),
        HabitDay(
          dayWeekName: "Fri",
          dayWeekNum: 18,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Thu",
          dayWeekNum: 17,
          color: const Color(0xff333333),
        ),
      ],
    ),
    Habit(
      title: "English",
      frequency: "4 times a week",
      habitDays: [
        HabitDay(
          dayWeekName: "Tue",
          dayWeekNum: 22,
          color: const Color(0xff5762F5),
        ),
        HabitDay(
          dayWeekName: "Mon",
          dayWeekNum: 21,
          color: const Color(0xff5762F5),
        ),
        HabitDay(
          dayWeekName: "Sun",
          dayWeekNum: 20,
          color: const Color(0xff5762F5),
        ),
        HabitDay(
          dayWeekName: "Sat",
          dayWeekNum: 19,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Fri",
          dayWeekNum: 18,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Thu",
          dayWeekNum: 17,
          color: const Color(0xff333333),
        ),
      ],
    ),
    Habit(
      title: "Meditation",
      frequency: "Everyday",
      habitDays: [
        HabitDay(
          dayWeekName: "Tue",
          dayWeekNum: 15,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Mon",
          dayWeekNum: 14,
          color: const Color(0xffE76967),
        ),
        HabitDay(
          dayWeekName: "Sun",
          dayWeekNum: 13,
          color: const Color(0xffE76967),
        ),
        HabitDay(
          dayWeekName: "Sat",
          dayWeekNum: 12,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Fri",
          dayWeekNum: 11,
          color: const Color(0xff333333),
        ),
        HabitDay(
          dayWeekName: "Thu",
          dayWeekNum: 10,
          color: const Color(0xffE76967),
        ),
      ],
    ),
  ];

  MainLoadedView({Key? key}) : super(key: key);

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
