import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/patients/patientadd.dart';
import 'package:flutter_application_1/patientdetails.dart';
import 'package:flutter_application_1/util/format_function.dart';
import 'package:logger/web.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PatientsManagerPage extends StatefulWidget {
  const PatientsManagerPage({super.key});

  @override
  State<PatientsManagerPage> createState() => _PatientsManagerPageState();
}

class _PatientsManagerPageState extends State<PatientsManagerPage> {
  final List _patients = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    Supabase.instance.client
        .from('medical_checkup')
        .select('*,senior_citizen(*)')
        .then((response) {
      final data = response;
      Logger().w(data);
      final users = data.map((patients) {
        return patients;
      }).toList();

      setState(() {
        _patients.clear();
        _patients.addAll(users);
      });
    }).onError((e, s) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error fetching users: ${e!.toString()}")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Patients Manager',
            style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddNewPatient()));
            },
            child: const Text('Add New', style: TextStyle(color: Colors.black)),
          ),
        ],
        backgroundColor: Colors.brown[200],
        elevation: 0,
      ),
      body: Column(
        children: [
          if (_patients.isEmpty) const Center(child: Text('No patients found')),
          Expanded(
            child: ListView.separated(
              itemCount: _patients.length,
              itemBuilder: (context, index) {
                final patient = _patients[index];
                return patientRow(
                    name: formatValue(patient['senior_citizen']['name']),
                    measurement: formatValue(patient['senior_citizen']['age']),
                    status: formatValue(patient['health_status']),
                    patient: patient);
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                legendItem('NORMAL', Colors.green),
                legendItem('NEED CARE', Colors.orange),
                legendItem('CRITICAL', Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget patientRow(
      {required String name,
      required String status,
      required String measurement,
      required Map<String, dynamic> patient}) {
    return MyWidget(
      name: name,
      measurement: '144/91 - 80 BPM',
      status: status,
      patient: patient,
    );
  }

  Widget legendItem(String label, Color color) {
    return Row(
      children: [
        Icon(Icons.flag, color: color),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  final Map<String, dynamic> patient;
  final String name, measurement, status;
  const MyWidget(
      {super.key,
      required this.name,
      required this.measurement,
      required this.status,
      required this.patient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PatientInfoPage(
                      patient: patient,
                    )));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: GestureDetector(
          child: ListTile(
            title:
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(measurement),
            trailing: Icon(
              Icons.flag,
              color: status == 'NORMAL'
                  ? Colors.green
                  : status == 'NEED CARE'
                      ? Colors.orange
                      : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
