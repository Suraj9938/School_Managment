import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/event_provider.dart';

class EventDetailScreen extends StatefulWidget {
  static const routeName = "/event_details";

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  Widget _topScreen() {
    final id = ModalRoute.of(context).settings.arguments as String;
    final events = Provider.of<EventProvider>(context).findById(id);

    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            events.eventImage,
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
    final id = ModalRoute.of(context).settings.arguments as String;
    final events = Provider.of<EventProvider>(context).findById(id);

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
              events.eventName,
              style: TextStyle(
                fontSize: 26,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontFamily: "font1",
              ),
            ),
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
                      child: Center(
                        child: Text(
                          events.eventDate,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.orange,
                            fontFamily: "font1",
                            fontSize: 18,
                          ),
                        ),
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
                        events.eventDay,
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
                        "${events.eventStartTime} - ${events.eventEndTime}",
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
              events.eventDescription,
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
