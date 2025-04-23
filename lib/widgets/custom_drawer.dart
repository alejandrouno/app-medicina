import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(context),
          _buildMenuItem(0, Icons.medication, 'Medicamentos', context),
          _buildMenuItem(1, Icons.person, 'Perfil', context),
          const Divider(),
          _buildMenuItem(2, Icons.settings, 'Configuración', context),
          _buildMenuItem(3, Icons.help, 'Ayuda', context),
          _buildMenuItem(4, Icons.logout, 'Cerrar Sesión', context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: const Text('Usuario Ejemplo'),
      accountEmail: const Text('usuario@example.com'),
      currentAccountPicture: const CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.person, size: 40, color: Colors.blue),
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade800,
      ),
    );
  }

  Widget _buildMenuItem(int index, IconData icon, String title, BuildContext context) {
    final bool isSelected = selectedIndex == index;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue.shade800 : Colors.grey),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue.shade800 : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onItemTapped(index);
      },
    );
  }
}