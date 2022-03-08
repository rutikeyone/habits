import 'package:dartz/dartz.dart';
import 'package:habits/domain/repository/date_repository.dart';
import 'package:habits/internal/locator.dart';

class DateController {
  Tuple3<List<DateTime>, List<DateTime>, List<String>> chooseDates(
      int frequencyCounter) {
    return getIt.get<DateRepository>().chooseDates(frequencyCounter);
  }
}
