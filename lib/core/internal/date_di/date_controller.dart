import '../../domain/repository/date_repository.dart';
import '../locator.dart';

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
}
