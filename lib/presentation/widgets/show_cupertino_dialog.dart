import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showCupertinoDialog({
  required BuildContext context,
  required Widget title,
  required List<CupertinoDialogAction> items,
}) {
  return showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: title,
      actions: items,
    ),
  );
}
