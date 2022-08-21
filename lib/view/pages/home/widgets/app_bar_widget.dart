import 'package:flutter/material.dart';
import 'package:g_test/service/auth_service.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Home",
        style: TextStyle(color: Colors.black87),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.logout_rounded,
            size: 28,
            color: Colors.red[800],
          ),
          onPressed: () => AuthService.handleSignOut(),
        )
      ],
    );
  }
}
