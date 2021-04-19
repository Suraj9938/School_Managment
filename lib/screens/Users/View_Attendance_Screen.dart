import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';

class ViewAttendanceScreen extends StatefulWidget {
  static const routeName = "/view_attendance";

  @override
  _ViewAttendanceScreenState createState() => _ViewAttendanceScreenState();
}

class _ViewAttendanceScreenState extends State<ViewAttendanceScreen> {
  String formattedEventDate;
  DateTime _eventDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Attendance",
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
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Select a Date: ",
                  style: TextStyle(
                    fontFamily: "font2",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 180,
                  padding: EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 6,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: RaisedButton(
                      color: Colors.orange,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formattedEventDate == null
                                ? "None"
                                : formattedEventDate.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "font2",
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 28,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () async {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2021),
                                lastDate: DateTime.now())
                            .then((date) {
                          setState(() {
                            _eventDate = date;
                            formattedEventDate =
                                DateFormat('MMMMd').format(_eventDate);
                            //_events['eventDate'] = formattedEventDate;
                          });
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              height: MediaQuery.of(context).size.height - 200,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Students",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: "font1",
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        height: 60,
                        child: ListTile(
                          title: Text(
                            "Sung Jin Woo",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "font2",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/otaku.png"),
                          ),
                          trailing: Container(
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: IconButton(
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        height: 60,
                        child: ListTile(
                          title: Text(
                            "Sung Jin Woo",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "font2",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/otaku.png"),
                          ),
                          trailing: Container(
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: IconButton(
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        height: 60,
                        child: ListTile(
                          title: Text(
                            "Sung Jin Woo",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "font2",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/otaku.png"),
                          ),
                          trailing: Container(
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        height: 60,
                        child: ListTile(
                          title: Text(
                            "Sung Jin Woo",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "font2",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/otaku.png"),
                          ),
                          trailing: Container(
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: IconButton(
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        height: 60,
                        child: ListTile(
                          title: Text(
                            "Sung Jin Woo",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "font2",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/otaku.png"),
                          ),
                          trailing: Container(
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        height: 60,
                        child: ListTile(
                          title: Text(
                            "Sung Jin Woo",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "font2",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/otaku.png"),
                          ),
                          trailing: Container(
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
