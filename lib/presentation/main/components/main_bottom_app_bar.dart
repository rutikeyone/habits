import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habits/domain/inherit/main_widget_provider.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/new_habit/new_habit_screen.dart';
import 'package:habits/presentation/state/main/main_bloc.dart';
import 'package:habits/presentation/state/main/main_event.dart';

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
        onTap: () =>
            MainWidgetProvider.of(context)?.model.newHabitOnPressed(context),
      ),
    );
  }
}
