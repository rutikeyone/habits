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

class ErrorEvent extends NewHabitEvent {
  final String error;

  const ErrorEvent({required this.error});
}
