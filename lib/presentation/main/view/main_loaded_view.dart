import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/presentation/main/components/main_app_bar.dart';
import 'package:habits/presentation/main/components/main_bottom_app_bar.dart';
import 'package:habits/presentation/state/main/main_bloc.dart';
import 'package:habits/presentation/state/main/main_event.dart';
import 'package:habits/presentation/widgets/habit_item.dart';

class MainLoadedView extends StatefulWidget {
  final List<Habit> habits;
  const MainLoadedView({
    Key? key,
    required this.habits,
  }) : super(key: key);

  @override
  State<MainLoadedView> createState() => _MainLoadedViewState();
}

class _MainLoadedViewState extends State<MainLoadedView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<MainBloc>(context).add(onResume());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Column(
        children: [
          const MainAppBar(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.habits.length,
              itemBuilder: (builder, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: HabitItem(
                      habit: widget.habits[index],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MainBottomAppBar(),
    );
  }
}
