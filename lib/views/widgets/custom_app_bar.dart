import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int notificationCount;
  final VoidCallback onNotificationTap;
  final VoidCallback onLogoutTap;

  const CustomAppBar({
    super.key,
    required this.notificationCount,
    required this.onNotificationTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(39, 79, 114, 1),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                size: 32,
                color: Colors.white,
              ),
              onPressed: onNotificationTap,
            ),
            if (notificationCount > 0)
              Positioned(
                right: 0,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: TextButton(
            onPressed: onLogoutTap,
            child: const Text(
              'Sair',
              style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16, 
                    // fontWeight: FontWeight.bold
                  ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
