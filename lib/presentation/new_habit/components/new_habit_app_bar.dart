import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/state/new_habit/new_habit_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';

class NewHabitAppBar extends StatelessWidget {
  const NewHabitAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Text(
              S.of(context).cancel,
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          GestureDetector(
            child: Text(
              S.of(context).done,
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: () {
              BlocProvider.of<NewHabitBloc>(context).add(AddEvent());
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
