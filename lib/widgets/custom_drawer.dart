import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Encabezado del drawer
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                    errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.local_hospital, size: 80, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'App Medicina',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Opción de Medicamentos
          ListTile(
            leading: const Icon(Icons.medication),
            title: const Text('Medicamentos'),
            selected: selectedIndex == 0,
            onTap: () {
              onItemTapped(0);
              Navigator.pop(context); // Cierra el drawer después de seleccionar
            },
          ),
          // Opción de Perfil
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            selected: selectedIndex == 1,
            onTap: () {
              onItemTapped(1);
              Navigator.pop(context); // Cierra el drawer después de seleccionar
            },
          ),
        ],
      ),
    );
  }
} 