import 'package:flutter/material.dart';
import 'package:social_app/screens/home_screen.dart';
import 'package:social_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
