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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo a la izquierda
            Image.asset(
              'assets/images/logo.png',
              height: 40,
              // Si no tienes el logo, usa un placeholder:
              errorBuilder: (context, error, stackTrace) => 
                const Text('LOGO APP MEDICINA', style: TextStyle(fontSize: 16)),
            ),
            // Avatar a la derecha
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
          ],
      ),
      drawer: CustomDrawer(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: _screens[_selectedIndex],
    );
  }
} 