import 'package:dartz/dartz.dart';

abstract class DateRepository {
  List<DateTime> chooseDates(int frequencyCounter);
  List<DateTime> getNextSevenDays();
}
