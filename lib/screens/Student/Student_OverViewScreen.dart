import 'package:flutter/material.dart';
import 'package:school_management/widget/Student_StaggeredView.dart';

class StudentOverViewScreen extends StatelessWidget {
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
      ),
      body: StudentStaggeredView(),
    );
  }
}