import 'package:equatable/equatable.dart';

class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const MainEvent();
}

class InitialEvent extends MainEvent {}

class LoadingEvent extends MainEvent {}

class LoadedEvent extends MainEvent {}

class ErrorEvent extends MainEvent {
  final String error;
  const ErrorEvent({required this.error});
}
