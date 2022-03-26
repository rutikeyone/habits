import 'package:flutter/cupertino.dart';

import '../../domain/repository/get_times_a_week_repository.dart';
import '../locator.dart';

class GetTimesAWeekController {
  String getTimesAWeek(
      {required int frequencyCounter, required BuildContext context}) {
    return getIt
        .get<GetTimesAWeekRepository>()
        .getTimesAWeek(frequencyCounter: frequencyCounter, context: context);
  }
}
