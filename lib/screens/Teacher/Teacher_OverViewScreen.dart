import 'package:flutter/material.dart';
import 'file:///D:/FYP/school_management/lib/widget/Teacher/Teacher_StaggeredView.dart';

class TeacherOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Teacher Overview",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
      ),
      body: TeacherStaggeredView(),
    );
  }
}
