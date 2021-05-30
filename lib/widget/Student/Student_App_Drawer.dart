import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/screens/Student/Order_Book_Screen.dart';
import 'file:///D:/FYP/school_management/lib/screens/Users/Auth_Screen.dart';
import 'file:///D:/FYP/school_management/lib/screens/Users/School_Event_Screen.dart';
import 'package:school_management/screens/Student/Student_Profile_Screen.dart';
import 'package:school_management/screens/Users/AssignmentView_Screen.dart';
import 'package:school_management/screens/Users/View_Attendance_Screen.dart';
import 'package:school_management/screens/Users/View_School_Info_Screen.dart';

class StudentAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentInfo =
        Provider.of<AuthProvider>(context, listen: false).LoggedInUser;

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                studentInfo.image,
              ),
            ),
            accountName: Text(
              studentInfo.name,
              style: TextStyle(
                fontFamily: "font2",
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              studentInfo.email,
              style: TextStyle(
                fontFamily: "font2",
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.assignment,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "Check Assignments",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, AssignmentViewScreen.routeName);
            },
          ),
          Divider(
            thickness: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.grading,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "View Attendance",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, ViewAttendanceScreen.routeName);
            },
          ),
          Divider(
            thickness: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.event,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "View Events",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, SchoolEventScreen.routeName);
            },
          ),
          Divider(
            thickness: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.school,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "View School Info",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, ViewSchoolInfoScreen.routeName);
            },
          ),
          Divider(
            thickness: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.book,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "Ordered Books",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, OrderBookScreen.routeName);
            },
          ),
          Divider(
            thickness: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.supervised_user_circle_rounded,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "View Profile",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, StudentProfileScreen.routeName);
            },
          ),
          Divider(
            thickness: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.exit_to_app,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "Exit",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, AuthScreen.routeName);
            },
          ),
          Divider(
            thickness: 5,
          ),
        ],
      ),
    );
  }
}
