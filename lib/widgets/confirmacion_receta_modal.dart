import 'package:flutter/material.dart';

class ConfirmacionRecetaModal extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> medicamentos;
  final VoidCallback onConfirm;

  const ConfirmacionRecetaModal({
    super.key,
    required this.title,
    required this.medicamentos,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title), // Quitado el const innecesario
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('¿Confirmar la asignación de estos medicamentos?'),
          const SizedBox(height: 20),
          ...medicamentos.map((med) => ListTile(
                leading: const Icon(Icons.medication),
                title: Text(med['nombre']),
                subtitle: Text('${med['dosis']} - ${med['frecuencia']}'),
              )),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
            onConfirm();
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}