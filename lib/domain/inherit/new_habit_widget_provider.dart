import 'package:flutter/cupertino.dart';
import 'package:habits/domain/model/new_habit_widget_model.dart';

class NewHabitWidgetProvider extends InheritedWidget {
  final NewHabitWidgetModel model;

  const NewHabitWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(NewHabitWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }

  static NewHabitWidgetProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewHabitWidgetProvider>();
  }
}
