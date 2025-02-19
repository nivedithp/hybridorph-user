import 'package:flutter/material.dart';
import 'package:flutter_application_1/patientadd.dart';
import 'package:flutter_application_1/patientdetails.dart';

class PatientsManagerPage extends StatelessWidget {
  const PatientsManagerPage({super.key});

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                patientRow('David', 'Normal', '\nAug 09, 2024 8:30 AM'),
                patientRow('Sumesh', 'Needs Care',
                    '152/76 - 71 BPM\nAug 01, 2024 8:42 AM'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                legendItem('Normal', Colors.green),
                legendItem('Needs Care', Colors.orange),
                legendItem('Critical', Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget patientRow(String name, String status, String measurement) {
    return MyWidget(name: name, measurement: '144/91 - 80 BPM', status: status);
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PatientsManagerPage(),
  ));
}

class MyWidget extends StatelessWidget {
  final String name, measurement, status;
  const MyWidget(
      {super.key,
      required this.name,
      required this.measurement,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PatientInfoPage()));
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
              color: status == 'Normal'
                  ? Colors.green
                  : status == 'Needs Care'
                      ? Colors.orange
                      : Colors.red,
            ),
          ),
        ),
      ),
    );
    ;
  }
}
