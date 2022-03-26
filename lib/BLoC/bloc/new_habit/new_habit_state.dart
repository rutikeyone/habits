import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewHabitState extends Equatable {
  @override
  List<Object?> get props => [];

  const NewHabitState();
}

class NewHabitEditState extends NewHabitState {}

class NewHabitErrorState extends NewHabitState {}
