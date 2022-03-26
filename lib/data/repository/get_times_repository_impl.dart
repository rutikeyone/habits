import 'package:flutter/cupertino.dart';
import 'package:habits/domain/repository/get_times_repository.dart';
import 'package:habits/generated/l10n.dart';

class GetTimesRepositoryImpl extends GetTimesRepository {
  @override
  String getTimes(int countTimes, BuildContext context) {
    if (countTimes == 2 || countTimes == 3 || countTimes == 4) {
      return S.of(context).times_2;
    }
    return S.of(context).times_1;
  }
}
