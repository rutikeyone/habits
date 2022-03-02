import 'package:flutter/material.dart';
import 'package:habits/presentation/main/view/main_loaded_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MainLoadedView());
  }
}
