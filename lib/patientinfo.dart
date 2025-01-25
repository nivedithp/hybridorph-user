import 'package:flutter/material.dart';

class PatientsManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Patients Manager', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Add New', style: TextStyle(color: Colors.black)),
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
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                patientRow(
                    'David', 'Normal', '144/91 - 80 BPM\nAug 09, 2024 8:30 AM'),
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
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }

  Widget legendItem(String label, Color color) {
    return Row(
      children: [
        Icon(Icons.flag, color: color),
        SizedBox(width: 4),
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
