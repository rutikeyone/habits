import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits/domain/inherit/new_habit_widget_provider.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/state/new_habit/new_habit_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';

class Frequency extends StatefulWidget {
  const Frequency({Key? key}) : super(key: key);

  @override
  State<Frequency> createState() => _FrequencyState();
}

class _FrequencyState extends State<Frequency> {
  int frequencyCounter = 0;

  void addFrequency() {
    if (frequencyCounter < 7) {
      setState(() {
        frequencyCounter++;
      });
      NewHabitWidgetProvider.of(context)
          ?.model
          .frequencyCounterChanged(frequencyCounter, context);
    }
  }

  void subtractFrequency() {
    if (frequencyCounter > 0) {
      setState(() {
        frequencyCounter--;
      });
      NewHabitWidgetProvider.of(context)
          ?.model
          .frequencyCounterChanged(frequencyCounter, context);
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
                  onPressed: subtractFrequency,
                  child: const Icon(
                    FontAwesomeIcons.minus,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  frequencyCounter.toString(),
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
                  onPressed: addFrequency,
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
