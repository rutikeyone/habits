abstract class DateRepository {
  List<DateTime> getNextSevenDays();

  List<DateTime> getSelectedDays(
      List<DateTime> nextSevenDays, int frequencyCounter);
}
