import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../generated/l10n.dart';
import '../../inherit/main_widget_provider.dart';
import '../../new_habit/new_habit_screen.dart';

class MainBottomAppBar extends StatelessWidget {
  const MainBottomAppBar({Key? key}) : super(key: key);

  @override
  BottomAppBar build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).primaryColorDark,
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
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
        ),
        onTap: () => MainWidgetProvider.of(context)?.newHabitOnPressed(context),
      ),
    );
  }
}
