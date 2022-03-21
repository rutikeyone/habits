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

class Details extends Route {
  Details() : super("DETAILS_ROUTE");
}
