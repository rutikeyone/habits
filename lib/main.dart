import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/BLoC/bloc/main/main_bloc.dart';
import 'core/BLoC/bloc/main/main_event.dart';
import 'core/BLoC/bloc/main/main_state.dart';
import 'core/BLoC/bloc/new_habit/new_habit_bloc.dart';
import 'core/BLoC/bloc/new_habit/new_habit_state.dart';
import 'core/BLoC/cubit/details/details_cubit.dart';
import 'core/domain/enums/details_enums.dart';
import 'core/internal/locator.dart';
import 'core/internal/notification_di/notification_controller.dart';
import 'generated/l10n.dart';
import 'presentation/details/details_screen.dart';
import 'presentation/main/main_screen.dart';
import 'presentation/navigation/route.dart';
import 'presentation/new_habit/new_habit_screen.dart';
import 'presentation/settings/settings_screen.dart';
import 'presentation/theme/dark_theme.dart';
import 'presentation/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await precachePictures();
  await getIt.get<NotificationController>().init();
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
        ),
        BlocProvider(
          create: (context) =>
              DetailsCubit(DetailsViewState(StatisticsType.theCurrentYear)),
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
            initialRoute: getIt.get<Main>().route,
            routes: {
              getIt.get<Main>().route: (context) => MainScreen(),
              getIt.get<Settings>().route: (context) => SettingsScreen(),
              getIt.get<NewHabit>().route: (context) => NewHabitScreen(),
              getIt.get<Details>().route: (context) => DetailsScreen(),
            },
          );
        },
      ),
    );
  }
}
