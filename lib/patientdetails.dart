import 'package:flutter/material.dart';
import 'package:flutter_application_1/patient_edit.dart';

class PatientInfoPage extends StatelessWidget {
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
                child: Icon(Icons.person),
              ),
              title: Text("David"),
              subtitle: Text("Age: 88\nID: 17002"),
            ),
          ),
          TabSection(),
        ],
      ),
    );
  }
}

class TabSection extends StatefulWidget {
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
                PatientDetails(),
                RecentDetails(),
                Center(child: Text("Prescription Data")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PatientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gender: Male"),
          Text("Blood Type: O+"),
          Text("Allergies: Roundworm"),
          Text("Diseases: Sunak BP"),
          Text("Height: 1.76 cm"),
          Text("Weight: 68 Kg"),
          Text("Last Visit: Aug 09, 2024"),
        ],
      ),
    );
  }
}

class RecentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Heart Rate: 80 BPM"),
          Text("BP: 144/91"),
          Text("Diseases: Sugar BP"),
          Text("Allergies: Roundworm"),
          Text("Recently Edited: Aug 09, 2024"),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditPatientPage()));
              // Add edit functionality here
            },
            child: Text("Edit"),
          )
        ],
      ),
    );
  }
}
