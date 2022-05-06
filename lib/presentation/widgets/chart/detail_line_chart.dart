import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'the_chart_data.dart';

class DetailLineChart extends StatelessWidget {
  final BuildContext context;
  final List<FlSpot> spots;
  late final List<Color> gradientColors;
  DetailLineChart({
    Key? key,
    required this.context,
    required this.spots,
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
                  right: 15.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                chartData(
                  context: context,
                  daysInMonth: 12,
                  gradientColors: gradientColors,
                  spots: spots,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
