import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/state/new_habit/new_habit_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';
import 'package:habits/presentation/widgets/input_text_form_field.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  bool _switchValue = false;
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 0, minute: 0);

  Future<void> pickTime() async {
    final _newTime =
        await showTimePicker(context: context, initialTime: _timeOfDay);
    if (_newTime != null && _newTime != _timeOfDay) {
      setState(() {
        _timeOfDay = _newTime;
      });
    }
  }

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
                  setState(() {
                    _switchValue = value;
                  });
                  BlocProvider.of<NewHabitBloc>(context).add(
                    NotificationChangedEvent(
                        areNotificationEnabled: _switchValue),
                  );
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
              Flexible(
                flex: 3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).inputDecorationTheme.fillColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10)),
                  onPressed: () => pickTime().then(
                    (_) => BlocProvider.of<NewHabitBloc>(context).add(
                      TimePickedEvent(timeOfDay: _timeOfDay),
                    ),
                  ),
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
                          "${_timeOfDay.hour}:${_timeOfDay.minute}",
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
                child: SizedBox(
                  height: 42.5,
                  child: InputTextFormField(
                    autofocus: false,
                    textChanged: (value) =>
                        BlocProvider.of<NewHabitBloc>(context)
                            .add(ReminderTextChanged(reminderText: value)),
                    hintText: S.of(context).reminder_text,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
