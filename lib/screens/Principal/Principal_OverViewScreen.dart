import 'package:flutter/material.dart';
import 'file:///D:/FYP/school_management/lib/widget/Principal/Principal_App_Drawer.dart';
import 'file:///D:/FYP/school_management/lib/widget/Principal/Principal_StaggeredView.dart';

class PrincipalOverViewScreen extends StatelessWidget {
  static const routeName = "/principal_overview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Principal Overview",
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
      drawer: PrincipalAppDrawer(),
      body: PrincipalStaggeredView(),
    );
  }
}
