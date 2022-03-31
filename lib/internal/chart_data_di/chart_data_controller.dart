import 'package:fl_chart/fl_chart.dart';
import 'package:habits/data/repository/get_chart_data_for_the_current_year_repository.dart';
import 'package:habits/data/repository/get_chart_data_for_the_past_three_years.dart';
import 'package:habits/data/repository/get_chart_data_last_year.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/internal/locator.dart';

class ChartDataController {
  List<FlSpot> getFlSpotsDataForTheCurrentYear(Habit habit) {
    return getIt
        .get<GetChartDataForTheCurrentYearRepository>()
        .getFlSpotsData(habit);
  }

  List<FlSpot> getFlSpotsDataLastYear(Habit habit) {
    return getIt.get<GetChartDataLastYearRepository>().getFlSpotsData(habit);
  }

  List<FlSpot> getFlSpotsDataForThePastThreeYears(Habit habit) {
    return getIt.get<GetChartDataForThePastThreeYears>().getFlSpotsData(habit);
  }
}
