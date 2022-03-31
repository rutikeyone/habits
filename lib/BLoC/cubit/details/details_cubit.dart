import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habits/domain/enums/details_enums.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsView> {
  DetailsCubit() : super(const DetailsView(StatisticsType.theCurrentYear));

  void updateTypeStatistics(StatisticsType type) {
    emit(DetailsView(type));
  }
}
