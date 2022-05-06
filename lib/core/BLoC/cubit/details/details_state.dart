part of 'details_cubit.dart';

abstract class DetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailsViewState extends DetailsState {
  final StatisticsType typeStatistics;
  @override
  List<Object> get props => [typeStatistics];

  DetailsViewState(this.typeStatistics);
}

class DetailsErrorState extends DetailsState {}
