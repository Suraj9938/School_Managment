import 'package:flutter/material.dart';
import 'package:school_management/screens/Auth_Screen.dart';
import 'package:school_management/screens/Calendar_Screen.dart';
import 'package:school_management/screens/Home_Screen.dart';
import 'package:school_management/screens/School_Event_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "School Management",
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: SchoolEventScreen(),
    );
  }
}

