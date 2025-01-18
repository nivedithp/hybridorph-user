import 'package:flutter/material.dart';
import 'package:flutter_application_1/LeavesPage.dart';
import 'package:flutter_application_1/login_screen1.dart';
import 'package:flutter_application_1/loginpage.dart';
import 'package:flutter_application_1/leave_applicationscreen.dart';
import 'package:flutter_application_1/LeavesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen1(),
    );
  }
}
