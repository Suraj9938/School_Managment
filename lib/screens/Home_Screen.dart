import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Education Core",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontFamily: "font1",
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
