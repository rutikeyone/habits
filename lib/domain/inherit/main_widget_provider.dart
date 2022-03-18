import 'package:flutter/cupertino.dart';
import 'package:habits/domain/model/main_widget_model.dart';

class MainWidgetProvider extends InheritedWidget {
  final MainWidgetModel model;

  const MainWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(MainWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }

  static MainWidgetProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainWidgetProvider>();
  }
}
