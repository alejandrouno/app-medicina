import 'package:flutter/material.dart';
import 'package:app_medicina/screens/admin/medicamento/asignacion_medicamentos_flow.dart';
import 'package:app_medicina/screens/admin/usuario/user_management_flow.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Administración'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAdminOption(
              icon: Icons.medication,
              label: 'Asignar Medicamentos',
              onPressed: () => _navigateToAsignacionMedicamentos(context),
            ),
            const SizedBox(height: 20),
            _buildAdminOption(
              icon: Icons.people,
              label: 'Gestión de Usuarios',
              onPressed: () =>
                  _navigateToGestionUsuarios(context), // Actualizado
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminOption({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 30),
      label: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade800,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
    );
  }

  void _navigateToAsignacionMedicamentos(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AsignacionMedicamentosFlow(),
      ),
    );
  }

  // Nuevo método para gestión de usuarios
  void _navigateToGestionUsuarios(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserManagementFlow(),
      ),
    );
  }
}
