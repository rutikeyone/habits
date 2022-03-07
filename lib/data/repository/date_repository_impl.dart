import 'dart:math';
import 'package:habits/domain/repository/date_repository.dart';

class DateRepositoryImpl extends DateRepository {
  final DateTime _now = DateTime.now();
  late final int _weekDay = DateTime(_now.year).weekday;
  List<DateTime> _nextSevenDays = [];
  List<DateTime> _selectedDates = [];
  List<int> _randomIndexs = [];

  @override
  List<DateTime> chooseDates(int frequencyCounter) {
    _nextSevenDays = getNextSevenDays();
    _randomIndexs = _getRandomIndexs(frequencyCounter);
    _selectedDates = _getSelectedDates();

    return _selectedDates;
  }

  List<DateTime> getNextSevenDays() {
    final List<DateTime> result = [];

    for (int i = 1; i <= _weekDay; i++) {
      result.add(DateTime(_now.year, _now.month, _now.day + i));
    }

    return result;
  }

  List<int> _getRandomIndexs(int frequencyCounter) {
    List<int> _randomIndexs = [];

    for (int i = 0; i < frequencyCounter; i++) {
      int number = Random().nextInt(_weekDay);
      while (_randomIndexs.contains(number)) {
        number = Random().nextInt(_weekDay);
      }
      _randomIndexs.add(number);
      _randomIndexs.sort();
    }

    return _randomIndexs;
  }

  List<DateTime> _getSelectedDates() {
    List<DateTime> _selectedDates = [];

    for (int i = 0; i < _randomIndexs.length; i++) {
      _selectedDates.add(_nextSevenDays[_randomIndexs[i]]);
    }

    return _selectedDates;
  }
}
