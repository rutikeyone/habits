import 'package:flutter/material.dart';

class DateOfTheMonthItem extends StatelessWidget {
  final Color backgroundColor;
  final String dayWeekName;
  final DateTime dayWeek;
  final VoidCallback onTap;

  const DateOfTheMonthItem({
    Key? key,
    required this.backgroundColor,
    required this.dayWeekName,
    required this.dayWeek,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            dayWeekName,
            style:
                Theme.of(context).textTheme.headline3!.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(12.5),
            alignment: Alignment.center,
            width: 45,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              dayWeek.day.toString(),
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
