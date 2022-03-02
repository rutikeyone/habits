import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits/generated/l10n.dart';

class Frequency extends StatefulWidget {
  const Frequency({Key? key}) : super(key: key);

  @override
  State<Frequency> createState() => _FrequencyState();
}

class _FrequencyState extends State<Frequency> {
  int counter = 0;

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
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  child: const Icon(
                    FontAwesomeIcons.minus,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  counter.toString(),
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
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
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
