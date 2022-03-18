import 'package:flutter/cupertino.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/presentation/main/main_screen.dart';
import 'package:habits/presentation/new_habit/new_habit_screen.dart';
import 'package:habits/presentation/settings/settings_screen.dart';

class Route {
  String route;

  Route(this.route);
}

class Main extends Route {
  Main() : super("MAIN");
}

class Settings extends Route {
  Settings() : super("SETTINGS_ROUTE");
}

class NewHabit extends Route {
  NewHabit() : super("NEWHABIT_ROUTE");
}
