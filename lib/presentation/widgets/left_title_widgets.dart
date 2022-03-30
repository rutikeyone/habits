import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LeftTitleWidgets extends StatelessWidget {
  final double value;
  final TitleMeta meta;
  final BuildContext context;
  const LeftTitleWidgets(
      {Key? key,
      required this.value,
      required this.meta,
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline4;
    String text;
    switch (value.toInt()) {
      case 20:
        text = '20%';
        break;

      case 40:
        text = '40%';
        break;

      case 60:
        text = '60%';
        break;

      case 80:
        text = '80%';
        break;

      case 100:
        text = '100%';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
