import 'package:flutter/material.dart';
import 'package:app_medicina/screens/login_screen.dart';
import 'package:app_medicina/screens/register_screen.dart';
import 'package:app_medicina/screens/home_screen.dart';
import 'package:app_medicina/screens/admin_screen.dart';

void main() => runApp(const MyApp());

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
      routes: {
        '/login': (context) => LoginScreen(
              onLoginSuccess: (isAdmin) {
                Navigator.pushReplacementNamed(
                  context,
                  isAdmin ? '/admin' : '/home',
                );
              },
            ),
        '/register': (context) => RegisterScreen(
              onLoginSuccess: (isAdmin) {
                Navigator.pushReplacementNamed(
                  context,
                  isAdmin ? '/admin' : '/home',
                );
              },
            ),
        '/home': (context) => const HomeScreen(),
        '/admin': (context) => const AdminScreen(),
      },
    );
  }
}