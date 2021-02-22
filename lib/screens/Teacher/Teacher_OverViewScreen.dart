import 'package:flutter/material.dart';
import 'package:school_management/widget/Teacher_StaggeredView.dart';

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
