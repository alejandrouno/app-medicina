import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "register_screen.dart";

class LoginScreen extends StatefulWidget {
  // Modificado para aceptar el rol del usuario como String
  final void Function(String userRole) onLoginSuccess;
  const LoginScreen({super.key, required this.onLoginSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _navigateToForgotPassword(BuildContext context) {
    if (kDebugMode) {
      print("Navigating to Forgot Password screen (Not implemented)");
    }
  }

  // Modificación: Determinar el rol del usuario basado en el email (ejemplo simple)
  String getUserRole(String email) {
    if (email.endsWith('@admin.com')) {
      return 'admin';
    } else if (email.endsWith('@medico.com')) {
      return 'medico';
    } else {
      return 'paciente'; // Rol por defecto si no coincide con admin o medico
    }
  }

  void _login(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Obtener el rol basado en el email
      String userRole = getUserRole(email);
      // Pasar el rol (String) a onLoginSuccess
      widget.onLoginSuccess(userRole);
      if (kDebugMode) {
        print(
            "Simulated login. Navigating to ${userRole == 'admin' ? 'admin' : userRole == 'medico' ? 'medico' : 'home'}");
      }
    } else if (kDebugMode) {
      print("Simulated login failed: Empty fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7AD9D4), // Turquesa claro
              Color(0xFFF5F2EE), // Beige claro
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 50), // Espacio para la barra de estado
              Image.asset(
                'assets/images/logo.png', // Asegúrate de tener una imagen de logo en esta ruta
                height: 120,
              ),
              const SizedBox(height: 40.0),
              Text(
                'Bienvenido de Nuevo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 40.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFFE45A5A)), // Rojo coral
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9), // Gris claro
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFE45A5A)), // Rojo coral
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFFE45A5A), // Rojo coral
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9), // Gris claro
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE45A5A), // Rojo coral
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5.0,
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  _login(context);
                },
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)), // Blanco
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => _navigateToForgotPassword(context),
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Colors.blueGrey, // Manteniendo un color similar al original para el texto secundario
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(
                      onLoginSuccess: (userRole) {
                        if (userRole == 'admin') {
                          Navigator.pushReplacementNamed(context, '/admin');
                        } else if (userRole == 'medico') {
                          Navigator.pushReplacementNamed(context, '/medico');
                        } else {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                    ),
                  ),
                ),
                child: RichText(
                  text: const TextSpan(
                    text: '¿No tienes cuenta? ',
                    style: TextStyle(
                      color: Colors.blueGrey, // Manteniendo un color similar al original
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'Regístrate',
                        style: TextStyle(
                          color: Color(0xFFE45A5A), // Rojo coral
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
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

