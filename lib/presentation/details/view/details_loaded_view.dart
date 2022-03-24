import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/presentation/details/components/details_app_bar.dart';
import 'package:habits/presentation/details/components/header_details.dart';

class DetailsLoadedView extends StatelessWidget {
  final Habit habit;
  const DetailsLoadedView({Key? key, required this.habit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Column(
        children: [
          DetailsAppBar(
            title: habit.title,
          ),
          const SizedBox(height: 10),
          HeaderDetails(habit: habit),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
