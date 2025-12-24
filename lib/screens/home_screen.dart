import 'package:flutter/material.dart';
import 'package:flutter_alerter/alerter/alerter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3FF),
      appBar: AppBar(
        title: const Text(
          'Alerter Demo',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            button(
              context,
              'DEFAULT ALERT',
              () => Alerter.show(
                context,
                title: 'Default Alert',
                message: 'This is a default alert message',
                icon: Icons.notifications_active,
                backgroundColor: const Color(0xFF5E4C8D),
              ),
            ),
            button(
              context,
              'COLOURED ALERT',
              () => Alerter.show(
                context,
                title: 'Coloured Alert',
                message: 'This alert has a custom color',
                icon: Icons.color_lens,
                backgroundColor: Colors.orange,
              ),
            ),

            button(
              context,
              'CUSTOM ICON ALERT',
              () => Alerter.show(
                context,
                title: 'Custom Icon',
                message: 'Alert with custom icon',
                icon: Icons.check_circle_outline,
                backgroundColor: Colors.green,
              ),
            ),

            button(
              context,
              'TEXT ONLY ALERT',
              () => Alerter.show(
                context,
                title: 'Text Only',
                message: 'No icon used here',
                backgroundColor: Colors.blueGrey,
              ),
            ),

            button(
              context,
              'ON CLICK ALERT',
              () => Alerter.show(
                context,
                title: 'On Click Alert',
                message: 'Tap alert to trigger action',
                icon: Icons.touch_app,
                backgroundColor: Colors.teal,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Alert clicked!')),
                  );
                },
              ),
            ),

            button(
              context,
              'VERBOSE ALERT',
              () => Alerter.show(
                context,
                title: 'Verbose Alert',
                message:
                    'This is a long alert message containing more detailed information for the user.',
                icon: Icons.info_outline,
                backgroundColor: Colors.indigo,
                duration: const Duration(seconds: 5),
              ),
            ),

            button(
              context,
              'INFINITY DURATION ALERT',
              () => Alerter.show(
                context,
                title: 'Infinity Alert',
                message: 'This alert stays until tapped',
                icon: Icons.all_inclusive,
                backgroundColor: Colors.red,
                duration: const Duration(days: 365),
              ),
            ),

            button(
              context,
              'PROGRESS ALERT',
              () => Alerter.show(
                context,
                title: 'Progress Alert',
                message: 'Loading... Please wait',
                showProgress: true,
                backgroundColor: Colors.purple,
                duration: const Duration(seconds: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(BuildContext context, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6A5ACD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 2,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
