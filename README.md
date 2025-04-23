# App Medicina

Aplicación móvil para la gestión de medicamentos y perfiles médicos, desarrollada con Flutter.

## Características

- **Autenticación de usuarios:** Permite a los usuarios registrarse e iniciar sesión de forma segura.
- **Roles de usuario:** Detecta si el usuario es un administrador (médico), mostrando una interfaz adicional para el envío de prescripciones y medicamentos.
- **Gestión de medicamentos:**
    - Listado detallado de medicamentos.
    - **Nota:** Los medicamentos son enviados por el administrador (médico) a los pacientes.
- **Perfil médico:**
    - Información personal del usuario.
- **Interfaz de usuario:** Intuitiva y moderna.

## Requisitos

- Flutter SDK (versión 2.0 o superior)
- Dart (versión 2.12 o superior)
- Android Studio / Visual Studio Code

## Instalación

1. Clona este repositorio
2. Instala las dependencias:
   ```
   flutter pub get
   ```
3. Ejecuta la aplicación:
   ```
   flutter run
   ```

## Estructura del proyecto

- `lib/main.dart`: Punto de entrada de la aplicación
- `lib/screens/`: Pantallas principales de la aplicación
  - `home_screen.dart`: Pantalla principal con menú
  - `medicamentos_screen.dart`: Listado de medicamentos
  - `perfil_screen.dart`: Información del perfil
- `lib/widgets/`: Componentes reutilizables
  - `custom_drawer.dart`: Menú lateral desplegable

## Capturas de pantalla

(Próximamente)

## Licencia

Este proyecto está bajo la Licencia MIT. 