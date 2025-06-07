import 'package:flutter/material.dart';

class UserFormScreen extends StatefulWidget {
  final Map<String, dynamic>? user;
  final Function(Map<String, dynamic>) onSave;

  const UserFormScreen({
    super.key,
    this.user,
    required this.onSave,
  });

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedRole = 'user';

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!['name'];
      _emailController.text = widget.user!['email'];
      _phoneController.text = widget.user!['phone'];
      _selectedRole = widget.user!['role'];
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSave({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'role': _selectedRole,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Nuevo Usuario' : 'Editar Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Completo *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email *',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => 
                  !value!.contains('@') ? 'Email inválido' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedRole,
                items: const [
                  DropdownMenuItem(value: 'paciente', child: Text('Paciente')),
                  DropdownMenuItem(value: 'admin', child: Text('Administrador')),
                  DropdownMenuItem(value: 'medico', child: Text('Médico')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Rol *',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _selectedRole = value!),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Guardar Usuario'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}