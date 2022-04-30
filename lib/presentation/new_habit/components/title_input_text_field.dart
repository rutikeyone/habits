import 'package:flutter/material.dart';
import 'package:habits/core/inherit/new_habit_widget_provider.dart';

import '../../../generated/l10n.dart';
import '../../widgets/input_text_form_field.dart';

class TitleInputTextField extends StatelessWidget {
  const TitleInputTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: InputTextFormField(
        autofocus: true,
        formKey: NewHabitWidgetProvider.of(context) != null
            ? NewHabitWidgetProvider.of(context)!.formTitleKey
            : GlobalKey<FormState>(),
        textChanged: (value) => NewHabitWidgetProvider.of(context) != null
            ? NewHabitWidgetProvider.of(context)?.title = value
            : null,
        validator: NewHabitWidgetProvider.of(context)?.titleValidator,
        hintText: S.of(context).title,
      ),
    );
  }
}
