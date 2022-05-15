import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
  BuildContext context, {
  required String message,
  bool positive = true,
}) {
  final colorScheme = Theme.of(context).colorScheme;

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 4,
    textColor: positive ? colorScheme.onPrimaryContainer : colorScheme.onErrorContainer,
    backgroundColor: positive ? colorScheme.primaryContainer : colorScheme.errorContainer,
    fontSize: 16,
  );
}
