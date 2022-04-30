import 'package:fl_chart/fl_chart.dart';
import '../../domain/extensions/int_extension.dart';
import '../../domain/model/habit.dart';
import '../../domain/repository/chart_data_repository.dart';

class GetChartDataForTheCurrentYearRepository extends ChartDataRepository {
  @override
  List<FlSpot> getFlSpotsData(Habit habit) {
    final _currentYear = DateTime.now().year;
    final List<FlSpot> _spots = (1.to(12, step: 1)).map((val) {
      final List<DateTime>? completedDaysByMonth = habit.completedDays
          .where((e) => (e.month == val && e.year == _currentYear))
          .toList();
      final List<DateTime>? totalDaysByMonth = habit.totalDays
          .where((e) => (e.month == val && e.year == _currentYear))
          .toList();

      return FlSpot(
        val.toDouble(),
        completedDaysByMonth != null &&
                totalDaysByMonth != null &&
                completedDaysByMonth.isNotEmpty &&
                totalDaysByMonth.isNotEmpty
            ? double.parse(
                ((completedDaysByMonth.length / totalDaysByMonth.length) * 100)
                    .toStringAsFixed(2))
            : 0,
      );
    }).toList();
    return _spots;
  }
}
