import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  static const routeName = "/calendar_screen";

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController _calendarController;
  var _eventStartTime;
  var _eventEndTime;

  OutlineInputBorder _outlineBorder() {
    return OutlineInputBorder(
      gapPadding: 0,
      borderSide: BorderSide(
        color: Colors.orange,
      ),
      borderRadius: BorderRadius.circular(25),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _calendarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Calendar Routine",
          style:
              TextStyle(color: Colors.white, fontSize: 22, fontFamily: "font1"),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 18,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  calendarController: _calendarController,
                  //events: _groupedEvents,
                  // onDaySelected: (date, events, holidays) {
                  //   setState(() {});
                  // },
                  weekendDays: [6],
                  headerStyle: HeaderStyle(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    headerMargin: const EdgeInsets.only(bottom: 8.0),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "font1",
                      fontWeight: FontWeight.normal,
                    ),
                    formatButtonVisible: false,
                    formatButtonDecoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                  calendarStyle: CalendarStyle(),
                  builders: CalendarBuilders(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12,
                  top: 10,
                ),
                child: Text(
                  "Mathematics",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: "font1",
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Container(
                  height: 60,
                  child: ListTile(
                    title: Text(
                      "Naruto Uzumaki",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "font2",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/Naruto.png",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Container(
                  height: 60,
                  child: ListTile(
                    title: Text(
                      "10 : 00 am to 11 : 00 am",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "font2",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/Naruto.png",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
