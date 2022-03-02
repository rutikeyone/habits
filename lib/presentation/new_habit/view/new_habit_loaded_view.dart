import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/new_habit/components/color_item.dart';
import 'package:habits/presentation/new_habit/components/input_text_form_field.dart';
import 'package:habits/presentation/new_habit/components/new_habit_app_bar.dart';

class NewHabitLoadedView extends StatefulWidget {
  const NewHabitLoadedView({Key? key}) : super(key: key);

  @override
  State<NewHabitLoadedView> createState() => _NewHabitLoadedViewState();
}

class _NewHabitLoadedViewState extends State<NewHabitLoadedView> {
  int selectedIndex = 0;

  int counter = 0;

  final List<Color> colorItems = [
    const Color(0xffE76967),
    const Color(0xffF5F186),
    const Color(0xff2DC976),
    const Color(0xff5665F2),
    const Color(0xff8F86F3),
    const Color(0xffAE8F72),
  ];

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewHabitAppBar(
              cancelOnPressed: () => Navigator.of(context).pop(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InputTextFormField(
                autofocus: true,
                hintText: S.of(context).title,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: 50,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: colorItems
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ColorItem(
                              color: item,
                              onTap: () {
                                setState(() {
                                  selectedIndex = colorItems.indexOf(item);
                                });
                              },
                              isSelected: colorItems[selectedIndex] == item,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 5,
                color: Theme.of(context).inputDecorationTheme.fillColor,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
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
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16),
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
                          primary:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16),
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
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 5,
                color: Theme.of(context).inputDecorationTheme.fillColor,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reminder",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            "Just notification",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      CupertinoSwitch(
                        onChanged: (bool value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                        value: _switchValue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.clock,
                              size: 20,
                              color:
                                  Theme.of(context).textTheme.headline3!.color,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "0:00",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 225,
                        height: 42.5,
                        child: InputTextFormField(
                          autofocus: false,
                          hintText: S.of(context).reminder_text,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 5,
                color: Theme.of(context).inputDecorationTheme.fillColor,
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
