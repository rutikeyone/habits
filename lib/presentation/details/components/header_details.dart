import 'package:flutter/material.dart';

import '../../../domain/model/habit.dart';
import '../../../generated/l10n.dart';
import '../../widgets/header_item.dart';

class HeaderDetails extends StatelessWidget {
  final Habit habit;
  const HeaderDetails({Key? key, required this.habit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderItem(text: habit.timesAWeek!, icon: Icons.repeat),
          const SizedBox(width: 15),
          HeaderItem(
            text: habit.notifications!.isNotEmpty
                ? S.of(context).reminder_on
                : S.of(context).reminder_off,
            icon: Icons.notifications,
          ),
        ],
      ),
    );
  }
}
