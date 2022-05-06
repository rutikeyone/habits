import 'package:flutter/cupertino.dart';

import 'model/settings_widget_model.dart';

class SettingsWidgetProvider extends InheritedNotifier<SettingsWidgetModel> {
  final SettingsWidgetModel model;

  const SettingsWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  @override
  bool updateShouldNotify(SettingsWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }

  static SettingsWidgetModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsWidgetProvider>()
        ?.model;
  }
}
