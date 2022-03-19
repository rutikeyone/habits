import 'package:flutter/cupertino.dart';
import 'package:habits/domain/model/new_habit_widget_model.dart';

class NewHabitWidgetProvider extends InheritedNotifier<NewHabitWidgetModel> {
  final NewHabitWidgetModel model;

  const NewHabitWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  @override
  bool updateShouldNotify(NewHabitWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }

  static NewHabitWidgetModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NewHabitWidgetProvider>()
        ?.model;
  }
}
