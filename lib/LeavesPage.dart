import 'package:flutter/material.dart';

class LeavesPage extends StatelessWidget {
  final List<Map<String, String>> leaves = [
    {
      "type": "Casual",
      "status": "Awaiting",
      "date": "Wed, 16 Dec 2020",
      "duration": "Half Day"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaves"),
        backgroundColor: Colors.blue, // Customize your theme color here
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
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
                  label: Text("All"),
                  selected: true,
                  onSelected: (bool value) {
                    // Handle filter for "All"
                  },
                ),
                FilterChip(
                  label: Text("Casual"),
                  selected: false,
                  onSelected: (bool value) {
                    // Handle filter for "Casual"
                  },
                ),
                FilterChip(
                  label: Text("Sick"),
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
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      leave['duration']! + " Application",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(leave['date']!),
                        Text(
                          leave['type']!,
                          style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: leave['status'] == "Approved"
                            ? Colors.green[100]
                            : leave['status'] == "Declined"
                                ? Colors.red[100]
                                : Colors.orange[100],
                        borderRadius: BorderRadius.circular(5),
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
