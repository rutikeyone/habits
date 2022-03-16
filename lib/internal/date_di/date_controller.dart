import 'package:habits/domain/repository/date_repository.dart';
import 'package:habits/internal/locator.dart';

class DateController {
  List<DateTime> getNextSevenDays() {
    return getIt.get<DateRepository>().getNextSevenDays();
  }

  List<DateTime> getSelectedDays(
      List<DateTime> nextSevenDays, frequencyCounter) {
    return getIt
        .get<DateRepository>()
        .getSelectedDays(nextSevenDays, frequencyCounter);
  }

  List<String> getNextSevenDaysName(List<DateTime> nextSevenDays) {
    return getIt.get<DateRepository>().getNextSevenDaysName(nextSevenDays);
  }
}