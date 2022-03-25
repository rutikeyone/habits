import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/inherit/new_habit_widget_provider.dart';

class Frequency extends StatelessWidget {
  const Frequency({Key? key}) : super(key: key);

  void addFrequency(BuildContext context) {
    if ((NewHabitWidgetProvider.of(context) != null
            ? NewHabitWidgetProvider.of(context)!.frequencyCounter
            : 0) <
        7) {
      NewHabitWidgetProvider.of(context)?.frequencyCounter++;
    }
  }

  void subtractFrequency(BuildContext context) {
    if ((NewHabitWidgetProvider.of(context) != null
            ? NewHabitWidgetProvider.of(context)!.frequencyCounter
            : 0) >
        0) {
      NewHabitWidgetProvider.of(context)?.frequencyCounter--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).frequency,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  S.of(context).times_a_week,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).inputDecorationTheme.fillColor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                  ),
                  onPressed: () => subtractFrequency(context),
                  child: const Icon(
                    FontAwesomeIcons.minus,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  NewHabitWidgetProvider.of(context) != null
                      ? NewHabitWidgetProvider.of(context)!
                          .frequencyCounter
                          .toString()
                      : 0.toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).inputDecorationTheme.fillColor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                  ),
                  onPressed: () => addFrequency(context),
                  child: const Icon(
                    FontAwesomeIcons.plus,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
