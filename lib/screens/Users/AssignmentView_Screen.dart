import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

enum AssignmentStatus { Assigned, Completed }

AssignmentStatus _assignmentStatus = AssignmentStatus.Assigned;

class AssignmentViewScreen extends StatefulWidget {
  static const routeName = "/assignment_view";

  @override
  _AssignmentViewScreenState createState() => _AssignmentViewScreenState();
}

class _AssignmentViewScreenState extends State<AssignmentViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            _assignmentStatus = AssignmentStatus.Assigned;
                          });
                        },
                        color:
                        _assignmentStatus == AssignmentStatus.Assigned
                            ? Colors.orange
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2 - 48,
                          child: Center(
                            child: Text(
                              "Assigned",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: _assignmentStatus ==
                                        AssignmentStatus.Assigned
                                    ? Colors.white
                                    : Colors.orange,
                                fontSize: 18,
                                fontFamily: "font2",
                              ),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            _assignmentStatus = AssignmentStatus.Completed;
                          });
                        },
                        color:
                        _assignmentStatus == AssignmentStatus.Completed
                            ? Colors.orange
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          child: Center(
                            child: Text(
                              "Completed",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: _assignmentStatus ==
                                        AssignmentStatus.Completed
                                    ? Colors.white
                                    : Colors.orange,
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
          ),
          _assignmentStatus == AssignmentStatus.Assigned
              ? Container(
                  padding: EdgeInsets.only(
                    top: 85,
                    left: 15,
                    right: 15,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  height: 12,
                                ),
                                Text(
                                  "Task : ",
                                  style: TextStyle(
                                    fontFamily: "font2",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: ReadMoreText(
                                    "To complete normalisation",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.justify,
                                    colorClickableText: Colors.orange,
                                    trimExpandedText: "See More",
                                    trimCollapsedText: "See Less",
                                    trimLines: 1,
                                    trimMode: TrimMode.Line,
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
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
                                Center(
                                  child: RaisedButton(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  height: 12,
                                ),
                                Text(
                                  "Task : ",
                                  style: TextStyle(
                                    fontFamily: "font2",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: ReadMoreText(
                                    "To complete normalisation and get familiar with SQL Programming Language",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.justify,
                                    colorClickableText: Colors.orange,
                                    trimExpandedText: "See Less",
                                    trimCollapsedText: "See More",
                                    trimLines: 1,
                                    trimMode: TrimMode.Line,
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
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
                                Center(
                                  child: RaisedButton(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  height: 12,
                                ),
                                Text(
                                  "Task : ",
                                  style: TextStyle(
                                    fontFamily: "font2",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: ReadMoreText(
                                    "To complete normalisation and get familiar with SQL Programming Language",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.justify,
                                    colorClickableText: Colors.orange,
                                    trimExpandedText: "See Less",
                                    trimCollapsedText: "See More",
                                    trimLines: 1,
                                    trimMode: TrimMode.Line,
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
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
                                Center(
                                  child: RaisedButton(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  height: 12,
                                ),
                                Text(
                                  "Task : ",
                                  style: TextStyle(
                                    fontFamily: "font2",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: ReadMoreText(
                                    "To complete normalisation and get familiar with SQL Programming Language",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.justify,
                                    colorClickableText: Colors.orange,
                                    trimExpandedText: "See Less",
                                    trimCollapsedText: "See More",
                                    trimLines: 1,
                                    trimMode: TrimMode.Line,
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
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
                                Center(
                                  child: RaisedButton(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  height: 12,
                                ),
                                Text(
                                  "Task : ",
                                  style: TextStyle(
                                    fontFamily: "font2",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: ReadMoreText(
                                    "To complete normalisation and get familiar with SQL Programming Language",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.justify,
                                    colorClickableText: Colors.orange,
                                    trimExpandedText: "See Less",
                                    trimCollapsedText: "See More",
                                    trimLines: 1,
                                    trimMode: TrimMode.Line,
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
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
                                Center(
                                  child: RaisedButton(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  height: 12,
                                ),
                                Text(
                                  "Task : ",
                                  style: TextStyle(
                                    fontFamily: "font2",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: ReadMoreText(
                                    "To complete normalisation and get familiar with SQL Programming Language",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.justify,
                                    colorClickableText: Colors.orange,
                                    trimExpandedText: "See Less",
                                    trimCollapsedText: "See More",
                                    trimLines: 1,
                                    trimMode: TrimMode.Line,
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
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
                                Center(
                                  child: RaisedButton(
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
                )
              : Container(),
          _assignmentStatus == AssignmentStatus.Completed
              ? Container(
                  child: Center(
                    child: Text(
                      "Completed Tasks",
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
