import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/presentation/inherit/main_widget_provider.dart';
import 'package:habits/presentation/inherit/model/main_widget_model.dart';
import 'package:habits/presentation/main/view/main_error_view.dart';
import 'package:habits/presentation/main/view/main_loaded_view.dart';
import 'package:habits/presentation/main/view/main_loading_view.dart';
import 'package:habits/presentation/bloc/main/main_bloc.dart';
import 'package:habits/presentation/bloc/main/main_event.dart';
import 'package:habits/presentation/bloc/main/main_state.dart';

class MainScreen extends StatelessWidget {
  final _model = MainWidgetModel();

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainWidgetProvider(
        model: _model,
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is LoadingState) {
              Future.delayed(
                const Duration(milliseconds: 500),
                () => BlocProvider.of<MainBloc>(context).add(
                  LoadedEvent(compareTo: state.compareTo),
                ),
              );
              return const MainLoadingView();
            }

            if (state is LoadedState) {
              return MainLoadedView(
                habits: state.habits,
              );
            }

            if (state is ErrorState) {
              return MainErrorView(error: state.error);
            }
            return const Scaffold();
          },
        ),
      ),
    );
  }
}
