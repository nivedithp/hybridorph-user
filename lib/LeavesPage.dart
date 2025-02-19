import 'package:flutter/material.dart';
import 'package:flutter_application_1/leave_applicationscreen.dart';

class LeavesPage extends StatelessWidget {
  final List<Map<String, String>> leaves = [
    {
      "type": "Casual",
      "status": "Awaiting",
      "date": "Wed, 16 Dec 2020",
      "duration": "Half Day"
    },
  ];

  LeavesPage({super.key});
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
        title: const Text("Leaves"),
        backgroundColor: Colors.brown[200], // Customize your theme color here
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LeaveApplicationScreen()));
              // Navigate to the leave application page
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs for All, Casual, and Sick
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(
                  label: const Text("All"),
                  selected: true,
                  onSelected: (bool value) {
                    // Handle filter for "All"
                  },
                ),
                FilterChip(
                  label: const Text("Casual"),
                  selected: false,
                  onSelected: (bool value) {
                    // Handle filter for "Casual"
                  },
                ),
                FilterChip(
                  label: const Text("Sick"),
                  selected: false,
                  onSelected: (bool value) {
                    // Handle filter for "Sick"
                  },
                ),
              ],
            ),
          ),
          // List of Leaves
          Expanded(
            child: ListView.builder(
              itemCount: leaves.length,
              itemBuilder: (context, index) {
                final leave = leaves[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      "${leave['duration']!} Application",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(leave['date']!),
                        Text(
                          leave['type']!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: leave['status'] == "Approved"
                            ? Colors.green[100]
                            : leave['status'] == "Declined"
                                ? Colors.red[100]
                                : Colors.orange[100],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        leave['status']!,
                        style: TextStyle(
                          color: leave['status'] == "Approved"
                              ? Colors.green
                              : leave['status'] == "Declined"
                                  ? Colors.red
                                  : Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LeavesPage(),
  ));
}
