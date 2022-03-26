import 'package:flutter/material.dart';

import '../../domain/repository/get_times_a_week_repository.dart';
import '../../generated/l10n.dart';

class GetTimesAWeekRepositoryImpl extends GetTimesAWeekRepository {
  @override
  String getTimesAWeek(
      {required int frequencyCounter, required BuildContext context}) {
    if (frequencyCounter == 2 ||
        frequencyCounter == 3 ||
        frequencyCounter == 4) {
      return "$frequencyCounter ${S.of(context).times_a_week_2}";
    }

    if (frequencyCounter == 7) {
      return S.of(context).everyday;
    }

    return "$frequencyCounter ${S.of(context).times_a_week_1}";
  }
}
