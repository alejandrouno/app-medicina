import 'package:flutter/material.dart';
import 'package:app_medicina/screens/gestor_usuario/login_screen.dart';
import 'package:app_medicina/screens/paciente/home_screen.dart';
import 'package:app_medicina/screens/admin/admin_screen.dart';
import 'package:app_medicina/screens/medico/medico_screen.dart'; // Corrected import path

void main() => runApp(const MyApp());

// Existing MyApp class definition remains
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Medicina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        // Manejar rutas con parámetros
        if (settings.name!.startsWith('/login')) {
          return MaterialPageRoute(
            builder: (_) => LoginScreen(
              onLoginSuccess: (userRole) {
                Navigator.pushReplacementNamed(
                  _,
                  userRole == 'admin' ? '/admin' : userRole == 'medico' ? '/medico' : '/home',
                );
              },
            ),
          );
        }
        return null;
      },
      routes: {
        '/login': (context) => LoginScreen(
              onLoginSuccess: (userRole) {
                Navigator.pushReplacementNamed(context,
                  userRole == 'admin' ? '/admin' : userRole == 'medico' ? '/medico' : '/home',
 );
              },
            ),
        '/home': (context) => const HomeScreen(),
        '/admin': (context) => const AdminScreen(), // Assuming this is the correct AdminScreen
        '/medico': (context) => const MedicoScreen(), // Use the prefixed MedicoScreen
      },
      onUnknownRoute: (settings) => MaterialPageRoute( // Manejar rutas no definidas
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Ruta no encontrada: ${settings.name}'),
          ),
        ),
      ),
    );
  }
}