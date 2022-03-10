import 'package:flutter/cupertino.dart';

abstract class GetTimesAWeekRepository {
  String getTimesAWeek({
    required int frequencyCounter,
    required BuildContext context,
  });
}
