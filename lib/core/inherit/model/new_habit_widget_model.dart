import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/core/BLoC/bloc/new_habit/new_habit_bloc.dart';
import 'package:habits/core/BLoC/bloc/new_habit/new_habit_event.dart';
import 'package:habits/core/domain/model/new_habit_data.dart';
import 'package:habits/presentation/theme/auxilary_color.dart';

import '../../../generated/l10n.dart';

class NewHabitWidgetModel extends ChangeNotifier {
  final GlobalKey<FormState> formTitleKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formReminderKey = GlobalKey<FormState>();

  String? _title;
  Color _unselectedColor = unselectedRed;
  Color _selectedColor = selectedRed;
  int _frequencyCounter = 0;
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 0, minute: 0);
  bool _areNotificationEnabled = false;
  String? _reminderText;

  String? get title => _title;
  set title(String? val) {
    formTitleKey.currentState?.validate();
    _title = val;
  }

  Color get unselectedColor => _unselectedColor;
  set unselectedColor(Color color) => _unselectedColor = color;

  Color get selectedColor => _selectedColor;
  set selectedColor(Color color) => _selectedColor = color;

  int get frequencyCounter => _frequencyCounter;
  set frequencyCounter(int val) {
    _frequencyCounter = val;
    if (val == 0) {
      areNotificationEnabled = false;
    }
    notifyListeners();
  }

  TimeOfDay get timeOfDay => _timeOfDay;
  set timeOfDay(TimeOfDay val) {
    _timeOfDay = val;
    notifyListeners();
  }

  bool get areNotificationEnabled => _areNotificationEnabled;
  set areNotificationEnabled(bool val) {
    if (frequencyCounter > 0) {
      _areNotificationEnabled = val;
      notifyListeners();
    }

    if (frequencyCounter == 0) {
      _areNotificationEnabled = false;
      notifyListeners();
    }

    formReminderKey.currentState?.validate();
  }

  String? get reminderText => _reminderText;
  set reminderText(String? val) {
    if (areNotificationEnabled) {
      formReminderKey.currentState?.validate();
    }
    _reminderText = val;
  }

  String? titleValidator(String? val, BuildContext context) {
    if (val == null || val.isEmpty) {
      return S.of(context).title_validator_message;
    }
    return null;
  }

  String? reminderValidator(String? val, BuildContext context) {
    if (areNotificationEnabled && (val == null || val.isEmpty)) {
      return S.of(context).reminder_validator_message;
    }
    return null;
  }

  Future<void> pickTime(BuildContext context) async {
    if (areNotificationEnabled) {
      final _newTime =
          await showTimePicker(context: context, initialTime: _timeOfDay);
      if (_newTime != null && _newTime != _timeOfDay) {
        timeOfDay = _newTime;
      }
    }
  }

  void onBackPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onDonePressed(BuildContext context) {
    final _validateReminder = formTitleKey.currentState!.validate();
    final _validateTitle = formReminderKey.currentState!.validate();
    if (_validateTitle && _validateReminder) {
      final NewHabitData data = NewHabitData(
          title!,
          unselectedColor,
          selectedColor,
          frequencyCounter,
          timeOfDay,
          areNotificationEnabled,
          reminderText);
      BlocProvider.of<NewHabitBloc>(context).add(AddEvent(context, data));
    }
  }
}
