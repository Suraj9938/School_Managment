import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class EventDetailScreen extends StatefulWidget {
  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  Widget _topScreen() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/event.png",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(50, 40),
          bottomLeft: Radius.elliptical(50, 40),
        ),
      ),
    );
  }

  Widget _bottomScreen() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 24,
          right: 36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dance Competition",
              style: TextStyle(
                fontSize: 26,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontFamily: "font1",
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 10, top: 10),
            //   child: Container(
            //     width: MediaQuery.of(context).size.width - 45,
            //     child: Padding(
            //       padding: EdgeInsets.only(
            //         top: 18,
            //         left: 15,
            //       ),
            //       child: Text(
            //         "Dance Competition is being held in Dance Room. All the interested students are to attend Dance Room in 3rd May.",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 18,
            //           fontFamily: "font1",
            //           letterSpacing: 1,
            //         ),
            //         textAlign: TextAlign.justify,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Container(
                      height: 80,
                      width: 115,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "JANUARY",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.orange,
                              fontFamily: "font1",
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "01",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: "font2",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sunday",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 21,
                          fontFamily: "font2",
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "10:00 - 12:00 pm",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          fontFamily: "font2",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              "About",
              style: TextStyle(
                fontSize: 24,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontFamily: "font1",
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "Eastwood High is organizing a Dance Competition on 15th October, 2021. All interested students are requested to attend Dance Room at 28th September on Dance Room exactly 12pm.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: "font2",
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _topScreen(),
            _bottomScreen(),
          ],
        ),
      ),
    );
  }
}
