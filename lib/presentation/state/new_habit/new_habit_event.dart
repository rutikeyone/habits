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
  final Color color;

  const ColorChangedEvent({required this.color});
}

class AddEvent extends NewHabitEvent {}

class ErrorEvent extends NewHabitEvent {
  final String error;

  const ErrorEvent({required this.error});
}
