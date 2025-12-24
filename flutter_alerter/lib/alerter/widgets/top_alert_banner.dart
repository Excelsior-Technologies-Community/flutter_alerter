import 'package:flutter/material.dart';

class TopAlertBanner extends StatefulWidget {
  final String title;
  final String message;
  final Color backgroundColor;
  final IconData? icon;
  final bool showProgress;
  final Duration duration;
  final VoidCallback onDismiss;
  final VoidCallback? onTap;

  const TopAlertBanner({
    super.key,
    required this.title,
    required this.message,
    required this.backgroundColor,
    this.icon,
    this.showProgress = false,
    required this.duration,
    required this.onDismiss,
    this.onTap,
  });

  @override
  State<TopAlertBanner> createState() => _TopAlertBannerState();
}

class _TopAlertBannerState extends State<TopAlertBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animation = Tween(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    controller.forward();
  }

  Future<void> dismiss() async {
    await controller.reverse();
    widget.onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: animation,
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            bottom: false,
            child: GestureDetector(
              onTap: () {
                widget.onTap?.call();
                dismiss();
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    if (widget.showProgress)
                      const SizedBox(
                        width: 28,
                        height: 28,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    else if (widget.icon != null)
                      Icon(widget.icon, color: Colors.white, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.message,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
