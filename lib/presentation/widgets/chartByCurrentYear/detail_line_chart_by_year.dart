import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';
import 'by_current_year_data.dart';

class DetailLineChartByCurrentYear extends StatelessWidget {
  final BuildContext context;
  final Habit habit;
  late final List<Color> gradientColors;
  DetailLineChartByCurrentYear({
    Key? key,
    required this.context,
    required this.habit,
  }) : super(key: key) {
    gradientColors = [
      Theme.of(context).errorColor,
      Theme.of(context).indicatorColor,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.25,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                byCurrentYearData(
                    habit: habit,
                    context: context,
                    daysInMonth: 12,
                    gradientColors: gradientColors),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
