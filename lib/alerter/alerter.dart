import 'package:flutter/material.dart';
import 'alerter_controller.dart';

class Alerter {
  static void show(
      BuildContext context, {
        required String title,
        required String message,
        Color backgroundColor = Colors.deepPurple,
        IconData? icon,
        bool showProgress = false,
        Duration duration = const Duration(seconds: 3),
        VoidCallback? onTap,
      }) {
    AlerterController.show(
      context,
      title: title,
      message: message,
      backgroundColor: backgroundColor,
      icon: icon,
      showProgress: showProgress,
      duration: duration,
      onTap: onTap,
    );
  }
}
