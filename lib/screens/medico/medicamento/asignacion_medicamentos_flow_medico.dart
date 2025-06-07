import 'package:app_medicina/screens/admin/medicamento/user_search_screen.dart';
import 'package:flutter/material.dart';

class AsignacionMedicamentosFlow extends StatelessWidget {
  const AsignacionMedicamentosFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const UserSearchScreen(),
          settings: settings,
        );
      },
    );
  }
}