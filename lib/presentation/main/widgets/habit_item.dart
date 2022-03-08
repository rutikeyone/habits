import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/generated/l10n.dart';

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
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        habit.title,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    habit.selectedDays.isNotEmpty
                        ? Flexible(
                            child: Text(
                              habit.selectedDays.length.toString() +
                                  " " +
                                  S.of(context).times_a_week_1,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              habit.selectedDays.isNotEmpty
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 70,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: false,
                            itemCount: habit.days.length,
                            itemBuilder: (builder, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                child: DateOfTheMonthItem(
                                  backgroundColor: habit.selectedDays
                                          .contains(habit.days[index])
                                      ? Color(habit.colorValue)
                                      : Color(0xff333333),
                                  dayWeekName: habit.weekDaysName[index],
                                  dayWeekNum: habit.days[index].day,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
      onTap: habitItemOnPressed,
    );
  }
}
