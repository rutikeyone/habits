import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/domain/inherit/new_habit_widget_provider.dart';
import 'package:habits/domain/model/new_habit_widget_model.dart';
import 'package:habits/presentation/new_habit/view/new_habit_loaded_view.dart';
import 'package:habits/presentation/state/new_habit/new_habit_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_state.dart';

class NewHabitScreen extends StatelessWidget {
  final _model = NewHabitWidgetModel();

  NewHabitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NewHabitWidgetProvider(
        model: _model,
        child: BlocBuilder<NewHabitBloc, NewHabitState>(
          builder: (context, state) {
            if (state is NewHabitEditState) {
              return const NewHabitLoadedView();
            }
            return const Scaffold();
          },
        ),
      ),
    );
  }
}
