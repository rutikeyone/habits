import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool autofocus;
  final String hintText;
  final void Function(String) textChanged;
  final String? Function(String? val, BuildContext context)? validator;
  const InputTextFormField({
    Key? key,
    required this.formKey,
    required this.autofocus,
    required this.hintText,
    required this.textChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: formKey,
        child: TextFormField(
          autofocus: autofocus,
          onChanged: textChanged,
          validator: (val) {
            if (validator != null) {
              return validator!(val, context);
            }
            return null;
          },
          textAlign: TextAlign.start,
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
            errorStyle: TextStyle(
              color: Theme.of(context).errorColor,
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            hintText: hintText,
            focusedErrorBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            hintStyle: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
