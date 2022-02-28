import 'package:flutter/material.dart';
import 'package:habits/presentation/main/components/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 15),
            child: MainAppBar(
              listOnPressed: () {},
              settingOnPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
