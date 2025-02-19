import 'package:flutter/material.dart';

class LeaveApplicationScreen extends StatelessWidget {
  const LeaveApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave Application"),
        backgroundColor: Colors.brown[200], // Customize your theme color here
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Notification action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Apply for Leave",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Leave Type Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Leave Type",
                border: OutlineInputBorder(),
              ),
              items: ["Casual", "Sick", "Other"].map((String type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                // Handle dropdown value change
              },
            ),
            const SizedBox(height: 20),
            // Leave Reason
            const TextField(
              decoration: InputDecoration(
                labelText: "Reason",
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            // Date Selection
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Start Date",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () {
                      // Open date picker for start date
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "End Date",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () {
                      // Open date picker for end date
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Submit leave application
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[300],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Apply for Leave",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LeaveApplicationScreen(),
  ));
}
