import 'package:flutter/material.dart';
import 'user_list_screen.dart';

class UserManagementFlow extends StatelessWidget {
  const UserManagementFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const UserListScreen(),
        );
      },
    );
  }
}