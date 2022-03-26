import 'package:equatable/equatable.dart';
import '../../../domain/model/habit.dart';

class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const MainEvent();
}

class InitialEvent extends MainEvent {}

class LoadingEvent extends MainEvent {}

class LoadedEvent extends MainEvent {
  int Function(Habit, Habit)? compareTo;
  LoadedEvent({this.compareTo});
}

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

class OnResume extends MainEvent {}

class SortByTitle extends MainEvent {}

class SortByFrequency extends MainEvent {}

class SortByCompletedDays extends MainEvent {}

class ErrorEvent extends MainEvent {
  final String error;
  const ErrorEvent({required this.error});
}
