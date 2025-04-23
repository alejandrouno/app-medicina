import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // Sample data (replace with actual data fetching)
  List<Patient> patients = [
    Patient(name: "Alice Johnson", id: "1"),
    Patient(name: "Bob Williams", id: "2"),
    Patient(name: "Charlie Brown", id: "3"),
    // ... more patients
  ];
  List<Prescription> history = []; // Initialize as empty

  String? selectedPatientId;
  String? medicationName;
  String? dosageInstructions;
  DateTime? sendDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Interface"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Patient List
            Text("Patient List", style: Theme.of(context).textTheme.titleLarge),
            //  Add search and filter functionality later
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(patients[index].name),
                    onTap: () {
                      //  Potentially navigate to patient details
                    },
                  );
                },
              ),
            ),

            // 2. Send Prescription/Medication
            const SizedBox(height: 20),
            Text("Send Prescription/Medication",
                style: Theme.of(context).textTheme.titleLarge),
            DropdownButtonFormField<String>(
              value: selectedPatientId,
              onChanged: (value) {
                setState(() {
                  selectedPatientId = value;
                });
              },
              items: patients.map((patient) {
                return DropdownMenuItem(
                  value: patient.id,
                  child: Text(patient.name),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: "Select Patient"),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Medication/Prescription Name"),
              onChanged: (value) {
                medicationName = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Dosage/Instructions"),
              onChanged: (value) {
                dosageInstructions = value;
              },
            ),
            // Use a date picker for sendDate
            // (Implementation omitted for brevity - use showDatePicker)
            ElevatedButton(
              onPressed: () {
                // Validate and send data (add to history for now)
                if (selectedPatientId != null &&
                    medicationName != null &&
                    dosageInstructions != null) {
                  setState(() {
                    history.add(Prescription(
                      patientId: selectedPatientId!,
                      medication: medicationName!,
                      dosage: dosageInstructions!,
                      date: DateTime.now(), // replace with actual sendDate
                    ));
                    // Clear fields after sending
                    selectedPatientId = null;
                    medicationName = null;
                    dosageInstructions = null;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Prescription/Medication Sent")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields")));
                }
              },
              child: const Text("Send"),
            ),

            // 3. History
            const SizedBox(height: 20),
            Text("History", style: Theme.of(context).textTheme.titleLarge),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        "${history[index].medication} to ${patients.firstWhere((p) => p.id == history[index].patientId).name}"),
                    subtitle: Text(
                        "${history[index].dosage} - ${history[index].date.toString()}"),
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

// Dummy classes for data
class Patient {
  final String name;
  final String id;
  Patient({required this.name, required this.id});
}

class Prescription {
  final String patientId;
  final String medication;
  final String dosage;
  final DateTime date;
  Prescription(
      {required this.patientId,
      required this.medication,
      required this.dosage,
      required this.date});
}