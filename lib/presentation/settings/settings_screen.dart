import 'package:flutter/material.dart';
import 'package:habits/presentation/settings/view/settings_loaded_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SettingsLoadedView(),
    );
  }
}
