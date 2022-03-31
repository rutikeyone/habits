import 'package:habits/domain/extensions/int_extension.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:fl_chart/src/chart/base/axis_chart/axis_chart_data.dart';
import 'package:habits/domain/repository/chart_data_repository.dart';

class GetChartDataLastYearRepository extends ChartDataRepository {
  @override
  List<FlSpot> getFlSpotsData(Habit habit) {
    final _lastYear = DateTime.now().year - 1;
    final List<FlSpot> _spots = (1.to(12, step: 1)).map((val) {
      final List<DateTime>? completedDaysByLastYear = habit.completedDays
          .where((e) => (e.month == val && e.year == _lastYear))
          .toList();
      final List<DateTime>? totalDaysByLastYear = habit.totalDays
          .where((e) => (e.month == val && e.year == _lastYear))
          .toList();

      return FlSpot(
        val.toDouble(),
        completedDaysByLastYear != null &&
                totalDaysByLastYear != null &&
                completedDaysByLastYear.isNotEmpty &&
                totalDaysByLastYear.isNotEmpty
            ? double.parse(
                ((completedDaysByLastYear.length / totalDaysByLastYear.length) *
                        100)
                    .toStringAsFixed(2))
            : 0,
      );
    }).toList();
    return _spots;
  }
}
