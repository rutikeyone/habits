import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habits/generated/l10n.dart';

class MainBottomAppBar extends StatelessWidget {
  final VoidCallback newHabitOnPressed;
  final Color? backgroundColor;

  const MainBottomAppBar(
      {Key? key, this.backgroundColor, required this.newHabitOnPressed})
      : super(key: key);

  @override
  BottomAppBar build(BuildContext context) {
    return BottomAppBar(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: GestureDetector(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/add.svg",
                width: 26,
                height: 26,
                color: Theme.of(context).textTheme.headline2!.color,
              ),
              const SizedBox(width: 10),
              Text(
                S.of(context).new_habits,
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          onTap: newHabitOnPressed,
        ),
      ),
    );
  }
}
