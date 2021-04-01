import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssignmentViewScreen extends StatefulWidget {
  @override
  _AssignmentViewScreenState createState() => _AssignmentViewScreenState();
}

class _AssignmentViewScreenState extends State<AssignmentViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Assignments",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            fontFamily: "font1",
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 28,
          left: 10,
          right: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 30,
                    color: Colors.white,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            height: 50,
                            width: 170,
                            color: Colors.orange,
                            child: Center(
                              child: Text(
                                "Assigned",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "font2",
                                ),
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            height: 50,
                            width: 170,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                "Completed",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.orange,
                                  fontSize: 18,
                                  fontFamily: "font2",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/child.png",
                            ),
                            radius: 22,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Billie Eilish",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: "font1",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Subject :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Economics",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Task :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "To complete normalisation",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/normalisation.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Mark as Complete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "font1",
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Assigned on ",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "January 01, 2021",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/child.png",
                            ),
                            radius: 22,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Billie Eilish",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: "font1",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Subject :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Economics",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Task :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "To complete normalisation",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/normalisation.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Mark as Complete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "font1",
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Assigned on ",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "January 01, 2021",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/child.png",
                            ),
                            radius: 22,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Billie Eilish",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: "font1",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Subject :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Economics",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Task :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "To complete normalisation",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/normalisation.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Mark as Complete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "font1",
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Assigned on ",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "January 01, 2021",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/child.png",
                            ),
                            radius: 22,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Billie Eilish",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: "font1",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Subject :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Economics",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Task :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "To complete normalisation",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/normalisation.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Mark as Complete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "font1",
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Assigned on ",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "January 01, 2021",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/child.png",
                            ),
                            radius: 22,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Billie Eilish",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: "font1",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Subject :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Economics",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Task :",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "To complete normalisation",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/normalisation.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Mark as Complete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "font1",
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Assigned on ",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "January 01, 2021",
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
