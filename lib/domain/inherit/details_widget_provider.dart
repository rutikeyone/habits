import 'package:flutter/cupertino.dart';
import 'package:habits/domain/model/details_widget_model.dart';

class DetailsWidgetProvider extends InheritedNotifier<DetailsWidgetModel> {
  final DetailsWidgetModel model;

  const DetailsWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  @override
  bool updateShouldNotify(DetailsWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }

  static DetailsWidgetModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DetailsWidgetProvider>()
        ?.model;
  }
}
