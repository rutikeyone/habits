import 'package:flutter/cupertino.dart';
import 'package:habits/domain/model/habit.dart';

class DetailsWidgetModel extends ChangeNotifier {
  void backOnPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void editOnPressed() {}
}
