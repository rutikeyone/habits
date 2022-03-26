import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:habits/domain/repository/get_times_repository.dart';
import 'package:habits/internal/locator.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsView());

  String getTimes(int countTimes, BuildContext context) {
    return getIt.get<GetTimesRepository>().getTimes(countTimes, context);
  }
}
