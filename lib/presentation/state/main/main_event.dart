import 'package:equatable/equatable.dart';
import 'package:habits/domain/model/habit.dart';

class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const MainEvent();
}

class InitialEvent extends MainEvent {}

class LoadingEvent extends MainEvent {}

class LoadedEvent extends MainEvent {}

class CompletedDate extends MainEvent {
  final Habit habit;
  final DateTime completedDate;

  const CompletedDate({
    required this.habit,
    required this.completedDate,
  });
}

class UncompletedDate extends MainEvent {
  final Habit habit;
  final DateTime completedDate;

  const UncompletedDate({
    required this.habit,
    required this.completedDate,
  });
}

class ErrorEvent extends MainEvent {
  final String error;
  const ErrorEvent({required this.error});
}
