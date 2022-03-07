import 'package:habits/domain/repository/date_repository.dart';
import 'package:habits/internal/locator.dart';

class DateController {
  List<DateTime> chooseDates(int frequencyCounter) {
    return getIt.get<DateRepository>().chooseDates(frequencyCounter);
  }

  List<DateTime> getSevenDays() {
    return getIt.get<DateRepository>().getNextSevenDays();
  }
}
