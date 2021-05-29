import 'package:flutter/material.dart';

class WorkInProgressScreen extends StatelessWidget {
  static const routeName = "/work_in_progress";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset("assets/images/WorkInProgress.png"),
        ),
      ),
    );
  }
}
