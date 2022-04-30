import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits/presentation/main/components/show_sort_dialog.dart';

import '../../../generated/l10n.dart';
import '../../inherit/main_widget_provider.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.list,
              size: 26,
              color: Theme.of(context).textTheme.headline1!.color,
            ),
            onPressed: () => showSortDialog(
              context: context,
              sortByTitleOnPressed: () {
                MainWidgetProvider.of(context)?.sortByTitle(context);
                Navigator.of(context).pop();
              },
              sortByFrequencyOnPressed: () {
                MainWidgetProvider.of(context)?.sortByFrequency(context);
                Navigator.of(context).pop();
              },
              sortByCompletedDaysOnPressed: () {
                MainWidgetProvider.of(context)?.sortByCompletedDays(context);
                Navigator.of(context).pop();
              },
            ),
            color: Theme.of(context).textTheme.headline1!.color,
          ),
          Text(
            S.of(context).habits,
            style: Theme.of(context).textTheme.headline1,
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/gear.svg",
              width: 26,
              height: 26,
              color: Theme.of(context).textTheme.headline1!.color,
            ),
            onPressed: () =>
                MainWidgetProvider.of(context)?.settingsOnPressed(context),
            color: Theme.of(context).textTheme.headline1!.color,
          ),
        ],
      ),
    );
  }
}
