import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habits/generated/l10n.dart';

class MainAppBar extends StatelessWidget {
  final VoidCallback listOnPressed;
  final VoidCallback settingOnPressed;

  const MainAppBar({
    Key? key,
    required this.listOnPressed,
    required this.settingOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.list,
          ),
          iconSize: 26,
          onPressed: listOnPressed,
          color: Theme.of(context).primaryColor,
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
            color: Theme.of(context).primaryColor,
          ),
          onPressed: settingOnPressed,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
