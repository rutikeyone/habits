import 'package:flutter/cupertino.dart';

import '../../../generated/l10n.dart';
import '../../widgets/show_cupertino_dialog.dart' as cupertinoDialog;

Future showSortDialog({
  required BuildContext context,
  required void Function()? sortByTitleOnPressed,
  required void Function()? sortByFrequencyOnPressed,
  required void Function()? sortByCompletedDaysOnPressed,
}) {
  return cupertinoDialog.showCupertinoDialog(
    context: context,
    title: Text(
      S.of(context).sort,
    ),
    items: [
      CupertinoDialogAction(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            S.of(context).by_title,
          ),
        ),
        onPressed: sortByTitleOnPressed,
      ),
      CupertinoDialogAction(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(S.of(context).by_frequency),
        ),
        onPressed: sortByFrequencyOnPressed,
      ),
      CupertinoDialogAction(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(S.of(context).by_completed_days),
        ),
        onPressed: sortByCompletedDaysOnPressed,
      ),
    ],
  );
}
