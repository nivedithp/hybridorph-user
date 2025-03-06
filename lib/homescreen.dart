import 'package:flutter/material.dart';
import 'package:flutter_application_1/LeavesPage.dart';
import 'package:flutter_application_1/features/patients/patientinfo.dart';
import 'package:flutter_application_1/features/sign_in/login_screen.dart';
import 'package:flutter_application_1/util/format_function.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'common_widgets.dart/custom_alert_dialog.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  Map<String, dynamic>? _staffDetails;

  @override
  void initState() {
    super.initState();
    fetchStaffDetails();
  }

  void fetchStaffDetails() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser!.id;
      final response = await Supabase.instance.client
          .from('staffs')
          .select('*')
          .eq('user_id', userId)
          .single();
      _staffDetails = response;
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Exception occurred: ${e.toString()}")));
    }
  }

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
                showDialog(
                  context: context,
                  builder: (context) => CustomAlertDialog(
                    title: "SIGN OUT",
                    content: const Text(
                      "Are you sure you want to Sign Out? Clicking 'Sign Out' will end your current session and require you to sign in again to access your account.",
                    ),
                    primaryButton: "SIGN OUT",
                    onPrimaryPressed: () {
                      Supabase.instance.client.auth.signOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                );
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
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: _staffDetails != null
                        ? NetworkImage(_staffDetails!['photo'])
                        : null,
                    backgroundColor: Colors.brown,
                    child: _staffDetails == null
                        ? Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatValue(_staffDetails?['name']),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        _staffDetails != null
                            ? _staffDetails!['id'].toString()
                            : "ID Number",
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

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     shadowColor: Colors.grey,
                  //     elevation: 4.0,
                  //     backgroundColor: Colors.brown[100],
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => NotificationsPage()));
                  //   },
                  //   child: Text(
                  //     " Notifications & Announcements",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(color: Colors.black, fontSize: 16),
                  //   ),
                  // ),

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

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     shadowColor: Colors.grey,
                  //     elevation: 4.0,
                  //     backgroundColor: Colors.brown[100],
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: Text(
                  //     "inventory",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 16),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
