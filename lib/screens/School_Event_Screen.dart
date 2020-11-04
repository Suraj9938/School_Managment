import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchoolEventScreen extends StatefulWidget {
  @override
  _SchoolEventScreenState createState() => _SchoolEventScreenState();
}

class _SchoolEventScreenState extends State<SchoolEventScreen> {
  Widget _topHalfUI() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/EventImage.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height / 4.6,
            ),
          ),
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            child: Center(
              child: Text(
                "Events",
                style: TextStyle(
                  fontFamily: "font1",
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 7.4,
            bottom: 7,
            left: 16,
            right: 16,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 18,
                  left: 15,
                  right: 15,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.orange, width: 3)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          "assets/images/school.png",
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Eastwood High",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "font1",
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.orange,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Kathmandu, Nepal, 781246",
                          style: TextStyle(
                            fontSize: 17,
                            //fontWeight: FontWeight.bold,
                            fontFamily: "font1",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.orange,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "01-4789623",
                          style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            fontFamily: "font1",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "FAVOURITE",
                                  style: TextStyle(
                                    fontSize: 15,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: "font2",
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "4059",
                                    style: TextStyle(
                                      fontSize: 14,
                                      //fontWeight: FontWeight.bold,
                                      fontFamily: "font2",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Followers",
                                    style: TextStyle(
                                      fontSize: 14,
                                      //fontWeight: FontWeight.bold,
                                      fontFamily: "font2",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topHalfUI(),
            Padding(
              padding: EdgeInsets.only(
                left: 22,
                top: 20,
              ),
              child: Text(
                "Events",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  left: 8,
                ),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 28,
                ),
                height: MediaQuery.of(context).size.height / 2.4,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/event.png",
                            height: 110,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Positioned(
                                child: Text(
                                  "Dance Competition",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                top: 0,
                                left: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range_rounded,
                                    color: Colors.blue,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "27th May, 2021",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "THE CUTTING ROOM",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/event.png",
                            height: 110,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Positioned(
                                child: Text(
                                  "Dance Competition",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                top: 0,
                                left: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range_rounded,
                                    color: Colors.blue,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "27th May, 2021",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "THE CUTTING ROOM",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/event.png",
                            height: 110,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Positioned(
                                child: Text(
                                  "Dance Competition",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                top: 0,
                                left: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range_rounded,
                                    color: Colors.blue,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "27th May, 2021",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "THE CUTTING ROOM",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/event.png",
                            height: 110,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Positioned(
                                child: Text(
                                  "Dance Competition",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                top: 0,
                                left: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range_rounded,
                                    color: Colors.blue,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "27th May, 2021",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "THE CUTTING ROOM",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/event.png",
                            height: 110,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Positioned(
                                child: Text(
                                  "Dance Competition",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                top: 0,
                                left: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range_rounded,
                                    color: Colors.blue,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "27th May, 2021",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "THE CUTTING ROOM",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/event.png",
                            height: 110,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Positioned(
                                child: Text(
                                  "Dance Competition",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                top: 0,
                                left: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range_rounded,
                                    color: Colors.blue,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "27th May, 2021",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "THE CUTTING ROOM",
                                    style: TextStyle(
                                      fontFamily: "font2",
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
