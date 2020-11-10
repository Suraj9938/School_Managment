import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';

class AssignmentViewScreen extends StatefulWidget {
  @override
  _AssignmentViewScreenState createState() => _AssignmentViewScreenState();
}

class _AssignmentViewScreenState extends State<AssignmentViewScreen> {
  DateTime _dateTime = DateTime.now();

  void userSelectedDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((selectDate) {
      setState(() {
        _dateTime = selectDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.grey[300],
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Assignments',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     color: Colors.orange,
            //     fontSize: 24,
            //     fontFamily: "font1",
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 30,
                  color: Colors.grey[100],
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
                          color: Colors.grey[100],
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
            // GestureDetector(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(
            //       8,
            //     ),
            //     child: Container(
            //       color: Colors.blue,
            //       padding: EdgeInsets.symmetric(
            //         horizontal: 8,
            //         vertical: 6,
            //       ),
            //       child: Text(
            //         "Select a Date",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w700,
            //           color: Colors.orange,
            //           fontSize: 18,
            //           fontFamily: "font2",
            //         ),
            //       ),
            //     ),
            //   ),
            //   onTap: () => userSelectedDate(context),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.only(
                left: 14,
              ),
              child: Text(
                "Subjects",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.orange,
                  fontSize: 22,
                  fontFamily: "font2",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.6,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        color: Colors.orange,
                        height: 145,
                        padding: EdgeInsets.only(left: 8),
                        width: MediaQuery.of(context).size.width - 85,
                        child: Container(
                          color: Colors.grey[100],
                          padding: EdgeInsets.only(
                            top: 13,
                            left: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    child: Image.network(
                                      "https://images-na.ssl-images-amazon.com/images/I/911gWcgY1YL.jpg",
                                      height: 120,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                    ),
                                    width: 148,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Mathematics",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.orange,
                                            fontSize: 20,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "4.7",
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.blue,
                                                fontSize: 17,
                                                fontFamily: "font2",
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "3 Assignments",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87,
                                            fontSize: 17,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        color: Colors.orange,
                        height: 145,
                        padding: EdgeInsets.only(left: 8),
                        width: MediaQuery.of(context).size.width - 85,
                        child: Container(
                          color: Colors.grey[100],
                          padding: EdgeInsets.only(
                            top: 13,
                            left: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    child: Image.network(
                                      "https://images-na.ssl-images-amazon.com/images/I/911gWcgY1YL.jpg",
                                      height: 120,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                    ),
                                    width: 148,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Mathematics",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.orange,
                                            fontSize: 20,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "4.7",
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.blue,
                                                fontSize: 17,
                                                fontFamily: "font2",
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "3 Assignments",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87,
                                            fontSize: 17,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        color: Colors.orange,
                        height: 145,
                        padding: EdgeInsets.only(left: 8),
                        width: MediaQuery.of(context).size.width - 85,
                        child: Container(
                          color: Colors.grey[100],
                          padding: EdgeInsets.only(
                            top: 13,
                            left: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    child: Image.network(
                                      "https://images-na.ssl-images-amazon.com/images/I/911gWcgY1YL.jpg",
                                      height: 120,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                    ),
                                    width: 148,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Mathematics",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.orange,
                                            fontSize: 20,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "4.7",
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.blue,
                                                fontSize: 17,
                                                fontFamily: "font2",
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "3 Assignments",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87,
                                            fontSize: 17,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        color: Colors.orange,
                        height: 145,
                        padding: EdgeInsets.only(left: 8),
                        width: MediaQuery.of(context).size.width - 85,
                        child: Container(
                          color: Colors.grey[100],
                          padding: EdgeInsets.only(
                            top: 13,
                            left: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    child: Image.network(
                                      "https://images-na.ssl-images-amazon.com/images/I/911gWcgY1YL.jpg",
                                      height: 120,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                    ),
                                    width: 148,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Mathematics",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.orange,
                                            fontSize: 20,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "4.7",
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.blue,
                                                fontSize: 17,
                                                fontFamily: "font2",
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "3 Assignments",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87,
                                            fontSize: 17,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        color: Colors.orange,
                        height: 145,
                        padding: EdgeInsets.only(left: 8),
                        width: MediaQuery.of(context).size.width - 85,
                        child: Container(
                          color: Colors.grey[100],
                          padding: EdgeInsets.only(
                            top: 13,
                            left: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    child: Image.network(
                                      "https://images-na.ssl-images-amazon.com/images/I/911gWcgY1YL.jpg",
                                      height: 120,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                    ),
                                    width: 148,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Mathematics",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.orange,
                                            fontSize: 20,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "4.7",
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.blue,
                                                fontSize: 17,
                                                fontFamily: "font2",
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "3 Assignments",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87,
                                            fontSize: 17,
                                            fontFamily: "font2",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
