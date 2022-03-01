import 'package:flutter/material.dart';
import 'package:habits/presentation/main/components/bottom_app_bar.dart';
import 'package:habits/presentation/main/components/date_of_the_month_item.dart';
import 'package:habits/presentation/main/components/main_app_bar.dart';
import 'package:habits/presentation/new_habit/new_habit_screen.dart';

class MainLoadedView extends StatelessWidget {
  const MainLoadedView({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.8),
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColorLight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Meditaion",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Everyday",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const DateOfTheMonthItem(
                        backgroundColor: Color(0xff333333),
                        dayWeekName: "Tue",
                        dayWeekNum: 15,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: MainBottomAppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        newHabitOnPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => const NewHabitScreen(),
            ),
          );
        },
      ),
    );
  }
}
