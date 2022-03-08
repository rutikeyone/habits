import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:habits/domain/repository/date_repository.dart';
import 'package:intl/intl.dart';

class DateRepositoryImpl extends DateRepository {
  final DateTime _now = DateTime.now();
  late final int _weekDay = DateTime(_now.year).weekday;
  List<DateTime> _nextSevenDays = [];
  List<DateTime> _selectedDates = [];
  List<String> _weekDaysName = [];
  List<int> _randomIndexs = [];

  @override
  Tuple3<List<DateTime>, List<DateTime>, List<String>> chooseDates(
      int frequencyCounter) {
    _nextSevenDays = _getNextSevenDays();
    _randomIndexs = _getRandomIndexs(frequencyCounter);
    _selectedDates = _getSelectedDates();
    _weekDaysName = _getWeekDaysName();

    return Tuple3(_nextSevenDays, _selectedDates, _weekDaysName);
  }

  List<DateTime> _getNextSevenDays() {
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

  List<String> _getWeekDaysName() {
    List<String> _weekDaysName = [];

    for (DateTime day in _nextSevenDays) {
      _weekDaysName.add(DateFormat('EEEE').format(day));
    }

    return _weekDaysName;
  }
}
