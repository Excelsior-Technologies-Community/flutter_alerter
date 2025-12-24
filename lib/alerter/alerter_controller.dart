import 'package:flutter/material.dart';
import 'widgets/top_alert_banner.dart';

class AlerterController {
  static void show(
      BuildContext context, {
        required String title,
        required String message,
        required Color backgroundColor,
        IconData? icon,
        bool showProgress = false,
        Duration duration = const Duration(seconds: 3),
        VoidCallback? onTap,
      }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => TopAlertBanner(
        title: title,
        message: message,
        backgroundColor: backgroundColor,
        icon: icon,
        showProgress: showProgress,
        duration: duration,
        onTap: onTap,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);

    if (duration != const Duration(days: 365)) {
      Future.delayed(duration, () {
        if (entry.mounted) entry.remove();
      });
    }
  }
}
