import 'package:flutter/material.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/new_habit/widgets/input_text_form_field.dart';

class TitleInputTextField extends StatelessWidget {
  const TitleInputTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: InputTextFormField(
        autofocus: true,
        hintText: S.of(context).title,
      ),
    );
  }
}
