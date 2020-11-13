import 'package:flutter/material.dart';
import 'package:school_management/screens/AssignmentView_Screen.dart';
import 'package:school_management/screens/Assignment_DetailScreen.dart';
import 'package:school_management/screens/Auth_Screen.dart';
import 'package:school_management/screens/Calendar_Screen.dart';
import 'package:school_management/screens/Event_DetailScreen.dart';
import 'package:school_management/screens/Home_Screen.dart';
import 'package:school_management/screens/Parent/Parent_OverView_Screen.dart';
import 'package:school_management/screens/Principal/Principal_OverViewScreen.dart';
import 'package:school_management/screens/School_Event_Screen.dart';
import 'package:school_management/screens/Student/Student_OverViewScreen.dart';
import 'package:school_management/screens/StudentProfile.dart';
import 'package:school_management/screens/StudentScreen.dart';
import 'package:school_management/screens/Teacher/Teacher_OverViewScreen.dart';

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
        //primaryColor: Color.fromRGBO(239, 228, 176, 1.0),
        primaryColor: Colors.orange,
      ),
      home: ParentOverViewScreen(),
      routes: {
        StudentScreen.routeName: (ctx) => StudentScreen(),
      },
    );
  }
}

