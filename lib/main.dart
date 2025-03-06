import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/sign_in/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ddnvpeypauuynmbgyxad.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkbnZwZXlwYXV1eW5tYmd5eGFkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMjg1NzExNywiZXhwIjoyMDQ4NDMzMTE3fQ.XwfnRGDlW9aeqBKG8m6-biI7EHZx_TAeMjjOreKOd50',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
