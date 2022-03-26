import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../inherit/settings_widget_provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).dark_theme,
                style: Theme.of(context).textTheme.headline2,
              ),
              CupertinoSwitch(
                onChanged: (bool value) => SettingsWidgetProvider.of(context) !=
                        null
                    ? SettingsWidgetProvider.of(context)!.isDarkTheme = value
                    : {},
                value: SettingsWidgetProvider.of(context) != null
                    ? SettingsWidgetProvider.of(context)!.isDarkTheme
                    : false,
              ),
            ],
          ),
          const SizedBox(height: 25),
          Container(
            height: 5,
            decoration: BoxDecoration(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
