import 'package:flutter/material.dart';
import 'package:app_medicina/widgets/confirmacion_receta_modal.dart';

class MedicamentoFormScreen extends StatefulWidget {
  const MedicamentoFormScreen({super.key});

  @override
  State<MedicamentoFormScreen> createState() => _MedicamentoFormScreenState();
}

class _MedicamentoFormScreenState extends State<MedicamentoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _medicamentos = [];

  void _addMedicamento() {
    _medicamentos.add({
      'nombre': '',
      'dosis': '',
      'frecuencia': 'Cada 8 horas',
      'fechaInicio': DateTime.now(),
      'fechaFin': DateTime.now().add(const Duration(days: 7)),
      'instrucciones': '',
    });
    setState(() {});
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => ConfirmacionRecetaModal(
          title: 'Confirmar Receta Médica',
          medicamentos: _medicamentos,
          onConfirm: () async {
            await Future.delayed(const Duration(seconds: 2));
            if (mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('¡Receta asignada correctamente!'),
                ),
              );
            }
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Receta'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ..._medicamentos.map((med) => _MedicamentoFormItem(
                    medicamento: med,
                    onChanged: (newData) => med.updateAll((key, value) => newData[key]),
                  )),
              ElevatedButton.icon(
                onPressed: _addMedicamento,
                icon: const Icon(Icons.add),
                label: const Text('Añadir otro medicamento'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Confirmar Receta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MedicamentoFormItem extends StatelessWidget {
  final Map<String, dynamic> medicamento;
  final Function(Map<String, dynamic>) onChanged;

  const _MedicamentoFormItem({
    required this.medicamento,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem<String>(
                  value: 'Paracetamol',
                  child: Text('Paracetamol'),
                ),
                DropdownMenuItem<String>(
                  value: 'Ibuprofeno',
                  child: Text('Ibuprofeno'),
                ),
              ],
              onChanged: (value) => onChanged({'nombre': value!}),
              decoration: const InputDecoration(labelText: 'Medicamento *'),
            ),
            TextFormField(
              onChanged: (value) => onChanged({'dosis': value}),
              validator: (value) => value!.isEmpty ? 'Campo obligatorio' : null,
              decoration: const InputDecoration(labelText: 'Dosis *'),
            ),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem<String>(
                  value: 'Cada 8 horas',
                  child: Text('Cada 8 horas'),
                ),
                DropdownMenuItem<String>(
                  value: '1 vez al día',
                  child: Text('1 vez al día'),
                ),
              ],
              onChanged: (value) => onChanged({'frecuencia': value!}),
              decoration: const InputDecoration(labelText: 'Frecuencia *'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                      );
                      if (date != null) onChanged({'fechaInicio': date});
                    },
                    decoration: const InputDecoration(labelText: 'Fecha Inicio *'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().add(const Duration(days: 7)),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                      );
                      if (date != null) onChanged({'fechaFin': date});
                    },
                    decoration: const InputDecoration(labelText: 'Fecha Fin *'),
                  ),
                ),
              ],
            ),
            TextFormField(
              onChanged: (value) => onChanged({'instrucciones': value}),
              decoration: const InputDecoration(labelText: 'Instrucciones adicionales'),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}