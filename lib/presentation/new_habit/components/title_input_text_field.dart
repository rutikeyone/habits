import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/new_habit/widgets/input_text_form_field.dart';
import 'package:habits/presentation/state/new_habit/new_habit_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';

class TitleInputTextField extends StatelessWidget {
  const TitleInputTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: InputTextFormField(
        autofocus: true,
        textChanged: (value) {
          BlocProvider.of<NewHabitBloc>(context)
              .add(TitleChangedEvent(value: value));
        },
        hintText: S.of(context).title,
      ),
    );
  }
}
