import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mi Perfil',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Avatar y nombre del usuario
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Usuario Médico',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'usuario@email.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Aquí iría la funcionalidad para editar el perfil
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Editar Perfil'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Información del perfil
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información Personal',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text('Nombre Completo'),
                        subtitle: Text('Dr. Juan Pérez García'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Teléfono'),
                        subtitle: Text('+34 123 456 789'),
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text('Fecha de Nacimiento'),
                        subtitle: Text('01/01/1980'),
                      ),
                      ListTile(
                        leading: Icon(Icons.work),
                        title: Text('Especialidad'),
                        subtitle: Text('Medicina Interna'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Opciones de configuración
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Configuración',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.notifications),
                        title: Text('Notificaciones'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                      ListTile(
                        leading: Icon(Icons.lock),
                        title: Text('Privacidad y Seguridad'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                      ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Ayuda y Soporte'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Aquí iría la funcionalidad para cerrar sesión
                  },
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'Cerrar Sesión',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 