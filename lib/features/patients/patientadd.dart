import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logger/web.dart';

class AddNewPatient extends StatefulWidget {
  @override
  _AddNewPatientState createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController healthStatusController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String category = 'NORMAL';
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _patients = [];
  Map<String, dynamic>? _selectedPatient;

  @override
  void initState() {
    super.initState();
    fetchPatients();
  }

  void fetchPatients() async {
    try {
      final response =
          await Supabase.instance.client.from('senior_citizen').select('*');

      final data = response;
      Logger().i("Patients fetched successfully: $data");

      setState(() {
        _patients = data.map((patient) => patient).toList();
      });
    } catch (e) {
      Logger().e("Exception occurred: $e");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Exception occurred: ${e.toString()}")));
    }
  }

  void submitData() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final response =
            await Supabase.instance.client.from('medical_checkup').insert({
          'individual_id': _selectedPatient?['id'],
          'health_status': category,
          'note': noteController.text,
          'doctor_user_id': Supabase.instance.client.auth.currentUser!.id,
        }).then((val) => Navigator.pop(context), onError: (e, s) {
          Logger().e("Error occurred: $e");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error occurred: ${e.toString()}")));
        });

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Patient data added successfully")));
        Navigator.pop(context);
      } catch (e) {
        Logger().e("Exception occurred: $e");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Exception occurred: ${e.toString()}")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Add New Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<Map<String, dynamic>>(
                value: _selectedPatient,
                onChanged: (value) {
                  setState(() {
                    _selectedPatient = value;
                  });
                },
                items: _patients.map((patient) {
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: patient,
                    child: Text(patient['name']),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Select Patient'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a patient';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: noteController,
                decoration: InputDecoration(labelText: 'Note'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a note';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: category,
                onChanged: (value) {
                  setState(() {
                    category = value!;
                  });
                },
                items:
                    ['NORMAL', 'NEED CARE', 'CRITICAL'].map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Status'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitData,
                child: Text('SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
