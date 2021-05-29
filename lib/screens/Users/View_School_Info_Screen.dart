import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/school_provider.dart';

enum SchoolTabs { AboutSchool, Description }

SchoolTabs _schoolTabs = SchoolTabs.AboutSchool;

class ViewSchoolInfoScreen extends StatefulWidget {
  static const routeName = "/view_school_info";

  @override
  _ViewSchoolInfoScreenState createState() => _ViewSchoolInfoScreenState();
}

class _ViewSchoolInfoScreenState extends State<ViewSchoolInfoScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About School",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: Provider.of<SchoolProvider>(context, listen: false)
            .setFetchSchoolData(),
        builder: (ctx, snapshot) {
          final schoolData =
              Provider.of<SchoolProvider>(context, listen: false).schoolData;
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 2 - 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              schoolData.schoolImage ??
                                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
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
                          schoolData.schoolName,
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
                          ? Column(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              schoolData.location,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              schoolData.schoolContact,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              schoolData.startTime +
                                                  " - " +
                                                  schoolData.endTime,
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
                            )
                          : Container(),
                      _schoolTabs == SchoolTabs.Description
                          ? Padding(
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
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          schoolData.schoolDescription,
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
