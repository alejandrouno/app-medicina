import 'package:flutter/material.dart';
import 'package:app_medicina/screens/admin/medicamento/medicamento_form_screen.dart';
import 'package:app_medicina/widgets/search_delegate.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _usuariosEjemplo = [
    {'nombre': 'Ana Pérez', 'id': '001', 'telefono': '555-1234'},
    {'nombre': 'Carlos Gómez', 'id': '002', 'telefono': '555-5678'},
    {'nombre': 'Luisa Martínez', 'id': '003', 'telefono': '555-9012'},
  ];

  void _navigateToMedicamentoForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MedicamentoFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asignar Medicamentos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchField(
              controller: _searchController,
              hintText: 'Buscar usuario...',
              onSearch: (query) {
                // Lógica de búsqueda básica (filtra la lista)
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _usuariosEjemplo.length, // ✅ Muestra 3 usuarios
                itemBuilder: (context, index) => ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(_usuariosEjemplo[index]['nombre']!),
                  subtitle: Text('ID: ${_usuariosEjemplo[index]['id']}'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: _navigateToMedicamentoForm,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}