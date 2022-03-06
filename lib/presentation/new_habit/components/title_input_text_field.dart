import 'package:flutter/material.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/new_habit/widgets/input_text_form_field.dart';

class TitleInputTextField extends StatelessWidget {
  final void Function(String) inputTextChanged;
  const TitleInputTextField({Key? key, required this.inputTextChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: InputTextFormField(
        autofocus: true,
        textChanged: inputTextChanged,
        hintText: S.of(context).title,
      ),
    );
  }
}
