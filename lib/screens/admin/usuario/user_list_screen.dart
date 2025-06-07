import 'package:app_medicina/widgets/confirmation_modal.dart';
import 'package:flutter/material.dart';
import 'user_form_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _users = [
    {
      'id': '1',
      'name': 'Ana Pérez',
      'email': 'ana@example.com',
      'role': 'user',
      'phone': '555-1234'
    },
    {
      'id': '2',
      'name': 'Carlos Gómez',
      'email': 'carlos@example.com',
      'role': 'admin',
      'phone': '555-5678'
    },
  ];

  void _navigateToUserForm([Map<String, dynamic>? user]) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserFormScreen(
              user: user,
              onSave: (newUser) => _handleSaveUser(newUser, user?['id'])),
        ));
  }

  void _handleSaveUser(Map<String, dynamic> user, [String? id]) {
    setState(() {
      if (id != null) {
        final index = _users.indexWhere((u) => u['id'] == id);
        _users[index] = {...user, 'id': id};
      } else {
        _users.add({...user, 'id': DateTime.now().toString()});
      }
    });
  }

  void _deleteUser(String id) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationModal(
        title: 'Eliminar Usuario',
        content: '¿Estás seguro de eliminar este usuario?',
        onConfirm: () {
          setState(() => _users.removeWhere((u) => u['id'] == id));
          Navigator.pop(context);
        }, // Eliminado parámetro innecesario
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Usuarios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToUserForm(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o email...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => setState(() {}),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) => _UserItem(
                  user: _users[index],
                  onEdit: () => _navigateToUserForm(_users[index]),
                  onDelete: () => _deleteUser(_users[index]['id']),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserItem extends StatelessWidget {
  final Map<String, dynamic> user;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _UserItem({
    required this.user,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(user['name'][0]),
        ),
        title: Text(user['name']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user['email']),
            Text('Rol: ${user['role']}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}