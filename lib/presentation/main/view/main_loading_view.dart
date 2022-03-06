import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLoadingView extends StatelessWidget {
  const MainLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: const Center(
          child: CupertinoActivityIndicator(
        radius: 20,
      )),
    );
  }
}
