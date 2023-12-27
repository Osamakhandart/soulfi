import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomBar {
  CustomBar._();
  static buildErrorSnackbar(BuildContext context, String message) {
    Flushbar(
      message: message,
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.red,
      ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Colors.blue[300],
    ).show(context);
  }
}
