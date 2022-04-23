import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:habits/domain/enums/details_enums.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/internal/chart_data_di/chart_data_controller.dart';
import 'package:habits/internal/locator.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  StatisticsType statisticsType = StatisticsType.theCurrentYear;
  DetailsCubit(DetailsState initialState) : super(initialState);

  void updateTypeStatistics(StatisticsType type) {
    statisticsType = type;
    emit(DetailsViewState(type));
  }

  List<FlSpot> getFlSpotsDataForTheCurrentYear(Habit habit) {
    return getIt
        .get<ChartDataController>()
        .getFlSpotsDataForTheCurrentYear(habit);
  }

  List<FlSpot> getFlSpotsDataLastYear(Habit habit) {
    return getIt.get<ChartDataController>().getFlSpotsDataLastYear(habit);
  }

  List<FlSpot> getFlSpotsDataForThePastThreeYears(Habit habit) {
    return getIt
        .get<ChartDataController>()
        .getFlSpotsDataForThePastThreeYears(habit);
  }
}
