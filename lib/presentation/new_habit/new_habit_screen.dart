import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/domain/inherit/new_habit_widget_provider.dart';
import 'package:habits/domain/model/new_habit_widget_model.dart';
import 'package:habits/presentation/new_habit/view/new_habit_loaded_view.dart';
import 'package:habits/presentation/state/new_habit/new_habit_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';
import 'package:habits/presentation/state/new_habit/new_habit_state.dart';

class NewHabitScreen extends StatelessWidget {
  final _model = NewHabitWidgetModel(
    onBackPressed: (context) => Navigator.pop(context),
    onDonePressed: (context) {
      BlocProvider.of<NewHabitBloc>(context).add(AddEvent(context: context));
      Navigator.of(context).pop();
    },
    // onTitleChanged: (value, context) =>
    //     BlocProvider.of<NewHabitBloc>(context).add(
    //   TitleChangedEvent(value: value),
    // ),
    onColorChanged: ({
      required context,
      required unselectedColor,
      required selectedColor,
    }) =>
        BlocProvider.of<NewHabitBloc>(context).add(
      ColorChangedEvent(
        unselectedColor: unselectedColor,
        selectedColor: selectedColor,
      ),
    ),
    frequencyCounterChanged: (value, context) =>
        BlocProvider.of<NewHabitBloc>(context)
            .add(FrequencyCounterChangedEvent(value: value)),
    onNotificationChanged: (areNotificationEnabled, context) =>
        BlocProvider.of<NewHabitBloc>(context).add(
      NotificationChangedEvent(areNotificationEnabled: areNotificationEnabled),
    ),
    onTimeChanged: (timeOfDay, context) =>
        BlocProvider.of<NewHabitBloc>(context).add(
      TimePickedEvent(timeOfDay: timeOfDay),
    ),
    onReminderTextChanged: (value, context) =>
        BlocProvider.of<NewHabitBloc>(context).add(
      ReminderTextChanged(reminderText: value),
    ),
  );

  NewHabitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NewHabitWidgetProvider(
        model: _model,
        child: BlocBuilder<NewHabitBloc, NewHabitState>(
          builder: (context, state) {
            if (state is NewHabitEditState) {
              return const NewHabitLoadedView();
            }
            return const Scaffold();
          },
        ),
      ),
    );
  }
}
