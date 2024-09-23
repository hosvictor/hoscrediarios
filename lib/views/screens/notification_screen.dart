import 'package:flutter/material.dart';
import 'package:hoscrediarios/api/dummy.dart';
import 'package:hoscrediarios/views/widgets/custom_notification.dart';

class NotificationScreen extends StatelessWidget {
  final String ambiente;

  const NotificationScreen({required this.ambiente, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
      ),
      body: Center(
        child: ListView(
              padding: const EdgeInsets.all(10),
              children: DUMMY_NOTIFICATION.map((notif) {
                return CustomNotificationWidget(notif);
              }).toList(),
            ),
      ),
    );
  }
}
