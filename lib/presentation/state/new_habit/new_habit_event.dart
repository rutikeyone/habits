import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NewHabitEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const NewHabitEvent();
}

class TitleChangedEvent extends NewHabitEvent {
  final String value;

  const TitleChangedEvent({required this.value});
}

class ColorChangedEvent extends NewHabitEvent {
  final Color unselectedColor;
  final Color selectedColor;

  const ColorChangedEvent({
    required this.unselectedColor,
    required this.selectedColor,
  });
}

class FrequencyCounterChangedEvent extends NewHabitEvent {
  final int value;

  const FrequencyCounterChangedEvent({required this.value});
}

class AddEvent extends NewHabitEvent {
  final BuildContext context;

  const AddEvent({required this.context});
}

class TimePickedEvent extends NewHabitEvent {
  final TimeOfDay timeOfDay;
  const TimePickedEvent({required this.timeOfDay});
}

class NotificationChangedEvent extends NewHabitEvent {
  final bool areNotificationEnabled;

  const NotificationChangedEvent({required this.areNotificationEnabled});
}

class ReminderTextChanged extends NewHabitEvent {
  final String reminderText;

  const ReminderTextChanged({required this.reminderText});
}

class ErrorEvent extends NewHabitEvent {
  final String error;

  const ErrorEvent({required this.error});
}
