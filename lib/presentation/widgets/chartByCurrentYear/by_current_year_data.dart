import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habits/domain/extensions/int_extension.dart';
import 'package:habits/domain/model/habit.dart';

import '../left_title_widgets.dart';
import 'by_current_year_bottom_title.dart';

LineChartData byCurrentYearData(
    {required BuildContext context,
    required double daysInMonth,
    required List<Color> gradientColors,
    required Habit habit}) {
  final _spots = _getFlSpotsByMonth(habit);
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 20,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Theme.of(context).canvasColor,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Theme.of(context).canvasColor,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: (val, meta) => ByCurrentYearBottomTitle(
              value: val, meta: meta, context: context),
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: (val, meta) =>
              LeftTitleWidgets(value: val, meta: meta, context: context),
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1)),
    minX: 0,
    maxX: daysInMonth,
    minY: 0,
    maxY: 100,
    lineBarsData: [
      LineChartBarData(
        spots: _spots,
        isCurved: true,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    ],
  );
}

List<FlSpot> _getFlSpotsByMonth(Habit habit) {
  final List<FlSpot> _spots = (1.to(12, step: 1)).map((val) {
    final List<DateTime>? completedDaysByMonth =
        habit.completedDays.where((e) => e.month == val).toList();
    final List<DateTime>? totalDaysByMonth =
        habit.totalDays.where((e) => e.month == val).toList();

    return FlSpot(
      val.toDouble(),
      completedDaysByMonth != null &&
              totalDaysByMonth != null &&
              completedDaysByMonth.isNotEmpty &&
              totalDaysByMonth.isNotEmpty
          ? double.parse(
              ((completedDaysByMonth.length / totalDaysByMonth.length) * 100)
                  .toStringAsFixed(2))
          : 0,
    );
  }).toList();
  return _spots;
}
