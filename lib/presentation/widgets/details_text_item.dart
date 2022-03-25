import 'package:flutter/material.dart';

class DetailsTextItem extends StatelessWidget {
  final String bodyText;
  final String bottomText;
  const DetailsTextItem({
    Key? key,
    required this.bodyText,
    required this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          bodyText,
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          bottomText,
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
