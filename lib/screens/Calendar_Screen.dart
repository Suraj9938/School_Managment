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
    //DateTime selectedDate = _calendarController.selectedDay;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Class Routine",
          style:
              TextStyle(color: Colors.white, fontSize: 22, fontFamily: "font1"),
        ),
      ),
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
              /*Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                child: Text(
                  DateFormat('| EEEE | dd MMMM, yyyy |').format(selectedDate),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "font2",
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
