import 'package:flutter/cupertino.dart';
import 'package:habits/domain/model/main_widget_model.dart';

class MainWidgetProvider extends InheritedNotifier<MainWidgetModel> {
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

  static MainWidgetModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MainWidgetProvider>()
        ?.model;
  }
}
