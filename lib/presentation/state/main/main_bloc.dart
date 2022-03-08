import 'package:bloc/bloc.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/locator.dart';
import 'package:habits/presentation/state/main/main_event.dart';
import 'package:habits/presentation/state/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required MainState initialState,
  }) : super(initialState) {
    on<MainEvent>(
      (event, emit) async {
        if (event is InitialEvent) {
          emit(LoadingState());
        }

        if (event is LoadedEvent) {
          try {
            final _habits = await getIt.get<DbController>().getAll();

            emit(LoadedState(habits: _habits));
          } catch (e) {
            emit(
              ErrorState(
                error: e.toString(),
              ),
            );
          }
        }

        if (event is ErrorEvent) {
          emit(ErrorState(error: event.error));
        }
      },
    );
  }
}
