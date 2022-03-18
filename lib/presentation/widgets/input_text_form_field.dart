import 'package:flutter/material.dart';
import 'package:habits/domain/inherit/new_habit_widget_provider.dart';

class InputTextFormField extends StatelessWidget {
  final bool autofocus;
  final String hintText;
  final void Function(String) textChanged;
  const InputTextFormField({
    Key? key,
    required this.autofocus,
    required this.hintText,
    required this.textChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        child: TextFormField(
          autofocus: autofocus,
          onChanged: textChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          style: Theme.of(context).textTheme.headline2,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
