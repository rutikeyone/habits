import 'package:flutter/material.dart';
import 'package:habits/presentation/settings/components/settings_app_bar.dart';

class SettingsLoadedView extends StatelessWidget {
  const SettingsLoadedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createSettingsAppBar(context),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}
