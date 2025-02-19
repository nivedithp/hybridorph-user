import 'package:flutter/material.dart';
import 'package:flutter_application_1/LeavesPage.dart';
import 'package:flutter_application_1/notification.dart';
import 'package:flutter_application_1/patientinfo.dart';

class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hybridorpho",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[200],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 145, 106, 92),
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle Home tap
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                // Handle Help tap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle Logout tap
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Color.fromARGB(255, 221, 216, 216),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.brown,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Staff Name",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "ID Number",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Grid Layout for Buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  // Leave Application
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 4.0,
                      backgroundColor: Colors.brown[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LeavesPage())); // Handle Leave Application
                    },
                    child: Text(
                      "Leave Application",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 4.0,
                      backgroundColor: Colors.brown[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationsPage()));
                    },
                    child: Text(
                      " Notifications & Announcements",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 4.0,
                      backgroundColor: Colors.brown[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientsManagerPage()));
                    },
                    child: Text(
                      "Patient Info",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 4.0,
                      backgroundColor: Colors.brown[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "inventory",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ],
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
    home: LoginScreen1(),
  ));
}
