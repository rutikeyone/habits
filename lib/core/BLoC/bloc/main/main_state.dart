import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/habit.dart';

@immutable
abstract class MainState extends Equatable {
  @override
  List<Object?> get props => [];

  const MainState();
}

class InitialState extends MainState {}

class LoadingState extends MainState {
  final int Function(Habit, Habit)? compareTo;
  const LoadingState({this.compareTo});
}

@immutable
class LoadedState extends MainState {
  final List<Habit> habits;

  const LoadedState({
    required this.habits,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoadedState && listEquals(other.habits, habits);
  }

  @override
  int get hashCode => habits.hashCode;
}

class ErrorState extends MainState {
  final String error;
  @override
  List<Object?> get props => [error];

  const ErrorState({required this.error});
}
