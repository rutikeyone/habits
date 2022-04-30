import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

AppBar createSettingsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColorDark,
    elevation: 0,
    title: Text(
      S.of(context).settings,
      style: Theme.of(context).textTheme.headline1,
    ),
  );
}
