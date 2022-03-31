import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartBottomTitle extends StatelessWidget {
  final double value;
  final TitleMeta meta;
  final BuildContext context;
  const ChartBottomTitle({
    Key? key,
    required this.value,
    required this.meta,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline4;
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text("1", style: style);
        break;
      case 2:
        text = Text("2", style: style);
        break;
      case 3:
        text = Text("3", style: style);
        break;
      case 4:
        text = Text("4", style: style);
        break;
      case 5:
        text = Text("5", style: style);
        break;
      case 6:
        text = Text("6", style: style);
        break;
      case 7:
        text = Text("7", style: style);
        break;
      case 8:
        text = Text("8", style: style);
        break;
      case 9:
        text = Text("9", style: style);
        break;
      case 10:
        text = Text("10", style: style);
        break;
      case 11:
        text = Text("11", style: style);
        break;
      case 12:
        text = Text("12", style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 15));
  }
}
