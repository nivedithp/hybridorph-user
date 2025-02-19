import 'package:flutter/material.dart';

class AddNewPatient extends StatefulWidget {
  @override
  _AddNewPatientState createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String category = 'NORMAL';
  final _formKey = GlobalKey<FormState>();

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
              TextFormField(
                controller: idController,
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
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
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    print('ID: ${idController.text}');
                    print('Name: ${nameController.text}');
                    print('Category: $category');
                  }
                },
                child: Text('SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
