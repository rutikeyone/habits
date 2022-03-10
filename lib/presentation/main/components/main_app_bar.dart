import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/settings/settings_screen.dart';

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
            icon: const FaIcon(
              FontAwesomeIcons.list,
            ),
            iconSize: 26,
            onPressed: () {},
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            color: Theme.of(context).textTheme.headline1!.color,
          ),
        ],
      ),
    );
  }
}
