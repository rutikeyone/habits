import 'package:dartz/dartz.dart';

abstract class DateRepository {
  Tuple3<List<DateTime>, List<DateTime>, List<String>> chooseDates(
      int frequencyCounter);
}
