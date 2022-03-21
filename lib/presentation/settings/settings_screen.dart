import 'package:flutter/material.dart';
import 'package:habits/domain/inherit/settings_widget_provider.dart';
import 'package:habits/domain/model/settings_widget_model.dart';
import 'package:habits/presentation/settings/view/settings_loaded_view.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsWidgetModel _model = SettingsWidgetModel();
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SettingsWidgetProvider(
        model: _model,
        child: const SettingsLoadedView(),
      ),
    );
  }
}
