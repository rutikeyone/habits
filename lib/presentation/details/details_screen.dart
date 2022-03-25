import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/presentation/details/view/details_loaded_view.dart';
import 'package:habits/presentation/inherit/details_widget_provider.dart';
import 'package:habits/presentation/inherit/model/details_widget_model.dart';

class DetailsScreen extends StatelessWidget {
  final model = DetailsWidgetModel();

  DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Habit habit = ModalRoute.of(context)?.settings.arguments as Habit;
    return SafeArea(
        child: DetailsWidgetProvider(
      model: model,
      child: DetailsLoadedView(
        habit: habit,
      ),
    ));
  }
}
