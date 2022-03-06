import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/presentation/main/view/main_error_view.dart';
import 'package:habits/presentation/main/view/main_loaded_view.dart';
import 'package:habits/presentation/main/view/main_loading_view.dart';
import 'package:habits/presentation/state/main/main_bloc.dart';
import 'package:habits/presentation/state/main/main_event.dart';
import 'package:habits/presentation/state/main/main_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is LoadingState) {
            Future.delayed(
              const Duration(milliseconds: 1500),
              () => BlocProvider.of<MainBloc>(context).add(
                LoadedEvent(),
              ),
            );
            return const MainLoadingView();
          }

          if (state is LoadedState) {
            return MainLoadedView();
          }

          if (state is ErrorState) {
            return MainErrorView(error: state.error);
          }
          return const Scaffold();
        },
      ),
    );
  }
}
