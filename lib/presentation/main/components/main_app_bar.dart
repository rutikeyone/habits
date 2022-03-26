import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          PopupMenuButton(
            offset: const Offset(0, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            iconSize: 26,
            color: Theme.of(context).inputDecorationTheme.fillColor,
            icon: FaIcon(
              FontAwesomeIcons.list,
              color: Theme.of(context).textTheme.headline1!.color,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  S.of(context).by_title,
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () =>
                    MainWidgetProvider.of(context)?.sortByTitle(context),
              ),
              PopupMenuItem(
                onTap: () =>
                    MainWidgetProvider.of(context)?.sortByFrequency(context),
                child: Text(
                  S.of(context).by_frequency,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              PopupMenuItem(
                onTap: () => MainWidgetProvider.of(context)
                    ?.sortByCompletedDays(context),
                child: Text(
                  S.of(context).by_completed_days,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
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
