import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/format_function.dart';

class PatientInfoPage extends StatelessWidget {
  final Map<String, dynamic> patient;
  const PatientInfoPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(patient['senior_citizen']['photo']),
              ),
              title: Text(patient['senior_citizen']['name']),
              subtitle: Text(
                  "Age: ${patient['senior_citizen']['age']}\nID: ${patient['senior_citizen']['id']}"),
            ),
          ),
          TabSection(patient: patient),
        ],
      ),
    );
  }
}

class TabSection extends StatefulWidget {
  final Map<String, dynamic> patient;
  const TabSection({super.key, required this.patient});

  @override
  _TabSectionState createState() => _TabSectionState();
}

class _TabSectionState extends State<TabSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: "Information"),
              Tab(text: "Recent"),
              Tab(text: "Prescription"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PatientDetails(patient: widget.patient),
                RecentDetails(patient: widget.patient),
                PrescriptionDetails(patient: widget.patient),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PatientDetails extends StatelessWidget {
  final Map<String, dynamic> patient;
  const PatientDetails({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gender: ${patient['senior_citizen']['gender']}"),
          Text("Blood Type: ${patient['senior_citizen']['blood_group']}"),
          Text("Allergies: ${patient['senior_citizen']['medical_condition']}"),
          Text("Phone: ${patient['senior_citizen']['phone']}"),
          Text(
              "Created At: ${formatDateTime(patient['senior_citizen']['created_at'])}"),
        ],
      ),
    );
  }
}

class RecentDetails extends StatelessWidget {
  final Map<String, dynamic> patient;
  const RecentDetails({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Health Status: ${patient['health_status']}"),
          Text("Note: ${patient['note']}"),
          Text("Doctor User ID: ${patient['doctor_user_id']}"),
          Text("Created At: ${patient['created_at']}"),
          // SizedBox(height: 10),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => EditPatientPage()));
          //     // Add edit functionality here
          //   },
          //   child: Text("Edit"),
          // )
        ],
      ),
    );
  }
}

class PrescriptionDetails extends StatelessWidget {
  final Map<String, dynamic> patient;
  const PrescriptionDetails({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Prescription Data:"),
          // Assuming prescription data is a list of strings
          Text("${patient['note']}"),
        ],
      ),
    );
  }
}
