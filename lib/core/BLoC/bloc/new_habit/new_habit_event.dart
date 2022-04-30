import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/new_habit_data.dart';

class NewHabitEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const NewHabitEvent();
}

class AddEvent extends NewHabitEvent {
  final BuildContext context;
  final NewHabitData data;

  const AddEvent(this.context, this.data);
}

class ErrorEvent extends NewHabitEvent {
  final String error;

  const ErrorEvent({required this.error});
}
