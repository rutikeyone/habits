import 'package:flutter/material.dart';
import 'package:habits/domain/model/temporary_data.dart';

import 'date_of_the_month_item.dart';

class HabitItem extends StatelessWidget {
  final Habit habit;
  final VoidCallback habitItemOnPressed;

  const HabitItem({
    Key? key,
    required this.habit,
    required this.habitItemOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColorLight,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      habit.title,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      habit.frequency,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 65,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemCount: habit.habitDays.length,
                  itemBuilder: (builder, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: DateOfTheMonthItem(
                      backgroundColor: habit.habitDays[index].color,
                      dayWeekName: habit.habitDays[index].dayWeekName,
                      dayWeekNum: habit.habitDays[index].dayWeekNum,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: habitItemOnPressed,
    );
  }
}
