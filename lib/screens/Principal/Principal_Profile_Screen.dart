import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management/screens/Principal/Principal_OverViewScreen.dart';

class PrincipalProfileScreen extends StatefulWidget {
  static const routeName = "/principal_profile";

  @override
  _PrincipalProfileScreenState createState() => _PrincipalProfileScreenState();
}

class _PrincipalProfileScreenState extends State<PrincipalProfileScreen> {
  Widget _topHalfUI() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
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
            top: 30,
            left: 5,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                Navigator.pushNamed(context, PrincipalOverViewScreen.routeName);
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            child: Center(
              child: Text(
                "Profile",
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
                    CircleAvatar(
                      maxRadius: 28,
                      backgroundImage: AssetImage(
                        "assets/images/otaku.png",
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Suraj Shrestha",
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
                          "Kathmandu, Nepal",
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
                          Icons.person,
                          color: Colors.orange,
                          size: 20,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Principal",
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomHalfUI() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.height / 2.2,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 18,
            left: 20,
            right: 15,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gender",
                style: TextStyle(
                  fontFamily: "font1",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "Male",
                style: TextStyle(
                  fontFamily: "font2",
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
              Divider(
                height: 24,
                thickness: 2,
              ),
              Text(
                "Age",
                style: TextStyle(
                  fontFamily: "font1",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "31",
                style: TextStyle(
                  fontFamily: "font2",
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              Divider(
                height: 24,
                thickness: 2,
              ),
              Text(
                "Mobile Number",
                style: TextStyle(
                  fontFamily: "font1",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "9889236587",
                style: TextStyle(
                  fontFamily: "font2",
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              Divider(
                height: 24,
                thickness: 2,
              ),
              Text(
                "Date of Birth",
                style: TextStyle(
                  fontFamily: "font1",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "1st November, 1989",
                style: TextStyle(
                  fontFamily: "font2",
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _topHalfUI(),
          SizedBox(
            height: 12,
          ),
          _bottomHalfUI(),
        ],
      ),
    );
  }
}
