part of 'details_cubit.dart';

class DetailsView extends Equatable {
  final StatisticsType typeStatistics;
  @override
  List<Object> get props => [typeStatistics];

  const DetailsView(this.typeStatistics);
}
