import 'dart:math';
import '../../domain/repository/date_repository.dart';
import 'package:intl/intl.dart';

class DateRepositoryImpl extends DateRepository {
  late final int _weekDays = 6;

  @override
  List<DateTime> getNextSevenDays() {
    final DateTime _now = DateTime.now();
    final List<DateTime> result = [];
    for (int i = 0; i <= _weekDays; i++) {
      result.add(DateTime(_now.year, _now.month, _now.day + i));
    }
    return result;
  }

  @override
  List<DateTime> getSelectedDays(
    List<DateTime> nextSevenDays,
    int frequencyCounter,
  ) {
    List<int> _randomIndexs = _getRandomIndexs(frequencyCounter, _weekDays);
    List<DateTime> _selectedDates = [];
    for (int i = 0; i < _randomIndexs.length; i++) {
      _selectedDates.add(nextSevenDays[_randomIndexs[i]]);
    }
    return _selectedDates;
  }

  List<int> _getRandomIndexs(int frequencyCounter, int weekDay) {
    List<int> _randomIndexs = [];

    if (frequencyCounter != 7) {
      for (int i = 0; i < frequencyCounter; i++) {
        int number = Random().nextInt(weekDay);
        while (_randomIndexs.contains(number)) {
          number = Random().nextInt(weekDay);
        }
        _randomIndexs.add(number);
      }
    } else {
      for (int i = 0; i < frequencyCounter; i++) {
        _randomIndexs.add(i);
      }
    }
    _randomIndexs.sort();
    return _randomIndexs;
  }
}
