import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/presentation/main/main_screen.dart';
import 'package:habits/presentation/state/main/main_bloc.dart';
import 'package:habits/presentation/state/main/main_event.dart';
import 'package:habits/presentation/state/main/main_state.dart';
import 'package:habits/presentation/state/new_habit/new_habit_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_state.dart';
import 'package:habits/presentation/theme/dark_theme.dart';
import 'package:habits/presentation/theme/light_theme.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(
            initialState: InitialState(),
          )..add(InitialEvent()),
        ),
        BlocProvider<NewHabitBloc>(
          create: (context) => NewHabitBloc(
            initialState: NewHabitEditState(),
          ),
        )
      ],
      child: AdaptiveTheme(
        initial: AdaptiveThemeMode.dark,
        light: light,
        dark: dark,
        builder: (dark, light) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: light,
            darkTheme: dark,
            supportedLocales: S.delegate.supportedLocales,
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
