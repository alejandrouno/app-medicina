import 'package:flutter/material.dart';

class MedicamentosScreen extends StatelessWidget {
  const MedicamentosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de ejemplo de medicamentos
    final List<Map<String, dynamic>> medicamentos = [
      {
        'nombre': 'Paracetamol',
        'dosis': '500mg',
        'frecuencia': 'Cada 8 horas',
        'descripcion': 'Analgésico y antipirético'
      },
      {
        'nombre': 'Ibuprofeno',
        'dosis': '400mg',
        'frecuencia': 'Cada 12 horas',
        'descripcion': 'Antiinflamatorio no esteroideo'
      },
      {
        'nombre': 'Omeprazol',
        'dosis': '20mg',
        'frecuencia': 'Una vez al día',
        'descripcion': 'Inhibidor de la bomba de protones'
      },
      {
        'nombre': 'Loratadina',
        'dosis': '10mg',
        'frecuencia': 'Una vez al día',
        'descripcion': 'Antihistamínico'
      },
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Medicamentos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: medicamentos.length,
                itemBuilder: (context, index) {
                  final medicamento = medicamentos[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.medication, color: Colors.white),
                      ),
                      title: Text(
                        medicamento['nombre'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dosis: ${medicamento['dosis']}'),
                          Text('Frecuencia: ${medicamento['frecuencia']}'),
                          Text('${medicamento['descripcion']}'),
                        ],
                      ),
                      isThreeLine: true,
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Aquí iría la funcionalidad para mostrar detalles del medicamento
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 