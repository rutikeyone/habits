import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/inherit/new_habit_widget_provider.dart';

import 'package:habits/presentation/widgets/input_text_form_field.dart';

class Reminder extends StatelessWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    S.of(context).reminder,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    S.of(context).just_notification,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
              CupertinoSwitch(
                onChanged: (bool value) {
                  NewHabitWidgetProvider.of(context)!.areNotificationEnabled =
                      value;
                },
                value: NewHabitWidgetProvider.of(context) != null
                    ? NewHabitWidgetProvider.of(context)!.areNotificationEnabled
                    : false,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).inputDecorationTheme.fillColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12.5)),
                  onPressed: () => NewHabitWidgetProvider.of(context) != null
                      ? NewHabitWidgetProvider.of(context)!.pickTime(context)
                      : null,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.clock,
                          size: 20,
                          color: Theme.of(context).textTheme.headline3!.color,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          NewHabitWidgetProvider.of(context) != null
                              ? NewHabitWidgetProvider.of(context)!
                                  .timeOfDay
                                  .format(context)
                              : const TimeOfDay(hour: 0, minute: 0)
                                  .format(context),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 5,
                child: InputTextFormField(
                  formKey: NewHabitWidgetProvider.of(context) != null
                      ? NewHabitWidgetProvider.of(context)!.formReminderKey
                      : GlobalKey<FormState>(),
                  autofocus: false,
                  textChanged: (value) => NewHabitWidgetProvider.of(context) !=
                          null
                      ? NewHabitWidgetProvider.of(context)?.reminderText = value
                      : null,
                  hintText: S.of(context).reminder_text,
                  validator:
                      NewHabitWidgetProvider.of(context)?.reminderValidator,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
