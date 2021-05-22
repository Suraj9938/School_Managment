import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/school_provider.dart';
import 'package:school_management/screens/Student/Student_OverViewScreen.dart';
import 'package:school_management/widget/Users/School_Event_ListView.dart';

class SchoolEventScreen extends StatefulWidget {
  static const routeName = "/school_event";

  @override
  _SchoolEventScreenState createState() => _SchoolEventScreenState();
}

class _SchoolEventScreenState extends State<SchoolEventScreen> {
  Widget _topHalfUI() {
    final schoolData =
        Provider.of<SchoolProvider>(context, listen: false).schoolData;
    return Container(
      height: MediaQuery.of(context).size.height / 2 - 70,
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
            top: 38,
            left: 18,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, StudentOverViewScreen.routeName);
              },
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
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          schoolData.schoolImage,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      schoolData.schoolName,
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
                          schoolData.location,
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
                          schoolData.schoolContact,
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
                      height: 4,
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
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: Provider.of<SchoolProvider>(context, listen: false)
            .setFetchSchoolData(),
        builder: (ctx, snapshot) {
          Provider.of<SchoolProvider>(context, listen: false).schoolData;
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
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
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SchoolEventListView(),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
