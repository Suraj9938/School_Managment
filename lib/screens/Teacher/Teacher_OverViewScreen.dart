import 'package:flutter/material.dart';
import 'file:///D:/FYP/school_management/lib/widget/Teacher/Teacher_StaggeredView.dart';
import 'package:school_management/widget/Teacher/Teacher_App_Drawer.dart';

class TeacherOverviewScreen extends StatelessWidget {
  static const routeName = "/teacher_overview";
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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 18,
        ),
        child: TeacherStaggeredView(),
      ),
      drawer: TeacherAppDrawer(),
    );
  }
}
