import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  final bool autofocus;
  final String hintText;
  const InputTextFormField({
    Key? key,
    required this.autofocus,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autofocus: autofocus,
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
    );
  }
}
