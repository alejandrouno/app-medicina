import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.onLoginSuccess});

  final void Function(bool isAdmin) onLoginSuccess;

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // AppBar con título "Registro"
        title: const Text('Registro', style: TextStyle(color: Colors.black87)), // Título en blanco
        elevation: 0, // Sin sombra en el AppBar para un look más limpio inicialmente
        backgroundColor: Colors.transparent, // Fondo transparente
      ),
      extendBodyBehindAppBar: true, // Permite que el body se extienda detrás del AppBar
      body: Container( // Usamos Container para el fondo con gradiente
        decoration: const BoxDecoration(
          gradient: LinearGradient( // Gradiente suave como fondo
            colors: [
              Color(0xFF7AD9D4), // Turquesa claro
              Color(0xFFF5F2EE), // Beige claro
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, // Cambio a bottomCenter
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Form(
              key: _formKey, // Clave para el formulario
              child: Column( // Columna para organizar los elementos del formulario
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[ // Lista de widgets hijos
                  const Text( // Título "Crear una cuenta"
                    'Crear una cuenta',
                    textAlign: TextAlign.center, // Centrar texto
                    style: TextStyle( // Estilo del texto
                      fontSize: 28.0, // Tamaño de fuente más grande
                      fontWeight: FontWeight.bold, // Texto en negrita
                      color: Color(0xFFE45A5A), // Rojo coral para el título
                    ),
                  ),
                  const SizedBox(height: 30.0), // Espacio más grande
                  TextFormField( // Campo de texto para el nombre completo
                    controller: _fullNameController, // Controlador para obtener el valor del texto
                    decoration: InputDecoration( // Decoración del campo de texto
                      labelText: 'Nombre completo',
                      prefixIcon: const Icon(Icons.person_outline), // Icono
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFD9D9D9), // Gris claro para el fondo
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Más padding vertical
                    ),
                    validator: (value) { // Validador para comprobar si el campo está vacío
                      if (value == null || value.isEmpty) { // Si el valor es nulo o vacío
                        return 'Por favor, ingrese su nombre completo'; // Mensaje de error
                      }
                      return null; // No hay error
                    },
                  ),
                  const SizedBox(height: 20), // Espaciado más consistente
                  TextFormField( // Campo de texto para el correo electrónico
                    controller: _emailController, // Controlador para obtener el valor del texto
                    decoration: InputDecoration( // Decoración del campo de texto
                      labelText: 'Correo electrónico',
                       prefixIcon: const Icon(Icons.email_outlined), // Icono
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8.0),
                         borderSide: BorderSide.none,
                      ),
                       filled: true, // Fondo relleno
                      fillColor: const Color(0xFFD9D9D9), // Gris claro para el fondo
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Más padding vertical
                    ),
                    keyboardType: TextInputType.emailAddress, // Tipo de teclado para correo electrónico
                    validator: (value) { // Validador para comprobar el formato del correo electrónico
                      if (value == null || value.isEmpty) { // Si el valor es nulo o vacío
                        return 'Por favor, ingrese su correo electrónico'; // Mensaje de error
                      }
                      if (!value.contains('@')) { // Si el valor no contiene "@"
                        return 'Por favor, ingrese un correo electrónico válido'; // Mensaje de error
                      }
                      return null; // No hay error
                    },
                  ),
                  const SizedBox(height: 20), // Espaciado más consistente
                  TextFormField( // Campo de texto para la contraseña
                    controller: _passwordController, // Controlador para obtener el valor del texto
                     decoration: InputDecoration( // Decoración del campo de texto
                      labelText: 'Contraseña',
                      prefixIcon: const Icon(Icons.lock_outline), // Icono
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8.0),
                         borderSide: BorderSide.none,
                      ),
                       filled: true, // Fondo relleno
                      fillColor: const Color(0xFFD9D9D9), // Gris claro para el fondo
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Más padding vertical
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                   const SizedBox(height: 16),
                  TextFormField( // Campo de texto para confirmar la contraseña
                    controller: _confirmPasswordController, // Controlador para obtener el valor del texto
                    decoration: InputDecoration( // Decoración del campo de texto
                     labelText: 'Confirmar contraseña',
                     prefixIcon: const Icon(Icons.lock_open_outlined), // Icono
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                      ), // Sin borde visible
                      filled: true,
                      fillColor: const Color(0xFFD9D9D9),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Más padding vertical
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, confirme su contraseña';
                      }
                      if (value != _passwordController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30), // Espacio más grande
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process registration
                        String fullName = _fullNameController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        // Here you would typically send the data to your backend
                        if (kDebugMode) {
                          print('Nombre completo: $fullName');
                        }
                        if (kDebugMode) {
                          print('Correo electrónico: $email');
                        }
                        if (kDebugMode) {
                          print('Contraseña: $password');
                        }

                        // For now, just show a success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registro exitoso'),
                          ),
                        );

                        // Optionally, navigate to another screen
                        // Navigator.pushReplacementNamed(context, '/login');
                      }
                    },
                     style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder( // Bordes redondeados para el botón
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: const Color(0xFFE45A5A), // Rojo coral para el fondo del botón
                      foregroundColor: Colors.white, // Texto blanco en el botón
                      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Estilo del texto del botón

                       elevation: 5.0, // Elevación para el botón
                     ),
                    child: const Text('Registrarse'),
                  ),
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
