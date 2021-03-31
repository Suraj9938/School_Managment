import 'package:flutter/material.dart';
import 'file:///D:/FYP/school_management/lib/widget/Student/Student_StaggeredView.dart';
import 'package:school_management/widget/Student/Student_App_Drawer.dart';

class StudentOverViewScreen extends StatelessWidget {
  static const routeName = "/student_overview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Overview",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: StudentAppDrawer(),
      body: StudentStaggeredView(),
    );
  }
}