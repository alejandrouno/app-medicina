import 'package:flutter/material.dart';

class MedicamentosScreen extends StatelessWidget {
  const MedicamentosScreen({Key? key}) : super(key: key);

  // Lista de medicamentos (mejor organizada como constante)
  static const List<Map<String, String>> medicamentos = [
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
      'nombre': 'Omeprazol-dormite',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Medicamentos'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildListaMedicamentos(),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildBotonAgregar(context),
    );
  }

  // Encabezado de la pantalla
  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mis Medicamentos',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Lista de medicamentos actuales',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Lista de medicamentos
  Widget _buildListaMedicamentos() {
    return Expanded(
      child: ListView.separated(
        itemCount: medicamentos.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) => _MedicamentoItem(
          medicamento: medicamentos[index],
          onTap: () => _mostrarDetalles(context, medicamentos[index]),
        ),
      ),
    );
  }

  // Botón flotante para agregar
  Widget _buildBotonAgregar(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: _agregarMedicamento,
      icon: const Icon(Icons.add_circle, size: 28),
      label: const Text('Agregar'),
      backgroundColor: Colors.blue.shade800,
      elevation: 4,
    );
  }

  // Funcionalidad para agregar medicamento (placeholder)
  void _agregarMedicamento() {
    // Implementar lógica de agregar
  }

  // Funcionalidad para mostrar detalles (placeholder)
  void _mostrarDetalles(BuildContext context, Map<String, String> medicamento) {
    // Implementar navegación a detalles
  }
}

// Widget personalizado para ítem de medicamento
class _MedicamentoItem extends StatelessWidget {
  final Map<String, String> medicamento;
  final VoidCallback onTap;

  const _MedicamentoItem({
    required this.medicamento,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Ícono con pastilla
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.medication,
                  size: 30,
                  color: Colors.blue.shade800,
                ),
              ),
              const SizedBox(width: 15),
              
              // Información del medicamento
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicamento['nombre']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildDetalle('Dosis', medicamento['dosis']!),
                    _buildDetalle('Frecuencia', medicamento['frecuencia']!),
                    _buildDetalle('Descripción', medicamento['descripcion']!),
                  ],
                ),
              ),
              
              // Ícono de flecha
              Icon(
                Icons.chevron_right,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para detalles individuales
  Widget _buildDetalle(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
          children: [
            TextSpan(
              text: '$titulo: ',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(text: valor),
          ],
        ),
      ),
    );
  }
}