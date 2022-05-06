import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/settings_app_bar.dart';
import '../components/theme_switch.dart';

class SettingsLoadedView extends StatelessWidget {
  const SettingsLoadedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: createSettingsAppBar(context),
        backgroundColor: Theme.of(context).primaryColorDark,
        body: const ThemeSwitch());
  }
}
