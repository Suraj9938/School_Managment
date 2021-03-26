import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SchoolTabs { AboutSchool, Description }

Widget _aboutSchool() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.location_on_sharp,
                size: 30,
                color: Colors.orange,
              ),
            ),
            title: Container(
              height: 54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "School Location",
                    style: TextStyle(
                      fontFamily: "font1",
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Chobhar, Kathmandu",
                    style: TextStyle(
                      fontFamily: "font2",
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 2,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.contact_phone_outlined,
                size: 25,
                color: Colors.orange,
              ),
            ),
            title: Container(
              height: 54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Number",
                    style: TextStyle(
                      fontFamily: "font1",
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "01-4586358",
                    style: TextStyle(
                      fontFamily: "font2",
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 2,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.access_time_outlined,
                size: 30,
                color: Colors.orange,
              ),
            ),
            title: Container(
              height: 54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time Period",
                    style: TextStyle(
                      fontFamily: "font1",
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "07: 00 am - 01: 00 pm",
                    style: TextStyle(
                      fontFamily: "font2",
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _description() {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 8,
    ),
    child: Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Container(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                "School BioData",
                style: TextStyle(
                  fontFamily: "font1",
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Modern Indian School is situated on the southern edge of Kathmandu city, on the Chobhar Dakshinkali road.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "font2",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Located 3 kilometers off the bustling city, the school lies nestled between lush pine forests.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "font2",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class SchoolOverViewScreen extends StatefulWidget {
  static const routeName = "/school_overview";
  @override
  _SchoolOverViewScreenState createState() => _SchoolOverViewScreenState();
}

class _SchoolOverViewScreenState extends State<SchoolOverViewScreen> {
  SchoolTabs _schoolTabs = SchoolTabs.AboutSchool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2 - 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/SchoolImage.png",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(40, 30),
                  bottomRight: Radius.elliptical(40, 30),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              child: Text(
                "Modern Indian School",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "font1",
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _schoolTabs = SchoolTabs.AboutSchool;
                      });
                    },
                    color: _schoolTabs == SchoolTabs.AboutSchool
                        ? Colors.orange
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        "About School",
                        style: TextStyle(
                          color: _schoolTabs == SchoolTabs.AboutSchool
                              ? Colors.white
                              : Colors.grey[600],
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _schoolTabs = SchoolTabs.Description;
                      });
                    },
                    color: _schoolTabs == SchoolTabs.Description
                        ? Colors.orange
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          color: _schoolTabs == SchoolTabs.Description
                              ? Colors.white
                              : Colors.grey[600],
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _schoolTabs == SchoolTabs.AboutSchool
                ? _aboutSchool()
                : Container(),
            _schoolTabs == SchoolTabs.Description
                ? _description()
                : Container(),
          ],
        ),
      ),
    );
  }
}
