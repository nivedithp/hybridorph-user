import 'package:flutter/material.dart';

class EditPatientPage extends StatelessWidget {
  final TextEditingController heartRate = TextEditingController();
  final TextEditingController bpSystolic = TextEditingController();
  final TextEditingController bpDiastolic = TextEditingController();
  final TextEditingController disease = TextEditingController();
  final TextEditingController allergies = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField("Heart Rate (BPM)", heartRate),
            buildBPField(),
            buildTextField("Disease", disease),
            buildTextField("Allergies", allergies),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Save")),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }

  Widget buildBPField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(child: buildTextField("BP (Sys)", bpSystolic)),
          SizedBox(width: 10),
          Expanded(child: buildTextField("BP (Dia)", bpDiastolic)),
        ],
      ),
    );
  }
}
