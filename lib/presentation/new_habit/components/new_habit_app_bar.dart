import 'package:flutter/material.dart';
import 'package:habits/domain/inherit/new_habit_widget_provider.dart';
import 'package:habits/generated/l10n.dart';

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
            onTap: () => NewHabitWidgetProvider.of(context) != null
                ? NewHabitWidgetProvider.of(context)!.onBackPressed(context)
                : {},
          ),
          GestureDetector(
            child: Text(
              S.of(context).done,
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: () => NewHabitWidgetProvider.of(context) != null
                ? NewHabitWidgetProvider.of(context)!.onDonePressed(context)
                : {},
          ),
        ],
      ),
    );
  }
}
