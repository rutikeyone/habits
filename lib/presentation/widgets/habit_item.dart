import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/habit.dart';
import '../inherit/main_widget_provider.dart';
import '../theme/auxilary_color.dart';
import 'date_of_the_month_item.dart';

class HabitItem extends StatelessWidget {
  final Habit habit;

  const HabitItem({
    Key? key,
    required this.habit,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 10,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        habit.title,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  habit.selectedDays.isNotEmpty ||
                          habit.completedDays.isNotEmpty
                      ? Flexible(flex: 1, child: Container())
                      : Container(),
                  habit.selectedDays.isNotEmpty ||
                          habit.completedDays.isNotEmpty
                      ? Flexible(
                          flex: 10,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              habit.timesAWeek!,
                              style: Theme.of(context).textTheme.headline3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              habit.selectedDays.isNotEmpty || habit.completedDays.isNotEmpty
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
                                  backgroundColor: habit.completedDays
                                          .contains(habit.days[index])
                                      ? Color(habit.selectedColorValue)
                                      : habit.selectedDays
                                              .contains(habit.days[index])
                                          ? Color(habit.unselectedColorValue)
                                          : baseHabitItemColor,
                                  dayWeekName: habit.weekDaysName[index],
                                  dayWeek: habit.days[index],
                                  onTap: () {
                                    if (habit.selectedDays
                                        .contains(habit.days[index])) {
                                      MainWidgetProvider.of(context)
                                          ?.onSelectCompletedDay(
                                              context: context,
                                              habit: habit,
                                              date: habit.days[index]);
                                    } else if (habit.completedDays
                                        .contains(habit.days[index])) {
                                      MainWidgetProvider.of(context)
                                          ?.onSelectUncompletedDay(
                                              context: context,
                                              habit: habit,
                                              date: habit.days[index]);
                                    }
                                  },
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
      onTap: () =>
          MainWidgetProvider.of(context)?.habitItemOnPressed(context, habit),
    );
  }
}
