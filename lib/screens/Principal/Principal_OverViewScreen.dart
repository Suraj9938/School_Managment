import 'package:flutter/material.dart';
import 'package:school_management/widget/Principal_StaggeredView.dart';

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
      ),
      body: PrincipalStaggeredView(),
    );
  }
}