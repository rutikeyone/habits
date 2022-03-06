import 'package:flutter/material.dart';

class MainErrorView extends StatelessWidget {
  final String error;

  const MainErrorView({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              error,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
