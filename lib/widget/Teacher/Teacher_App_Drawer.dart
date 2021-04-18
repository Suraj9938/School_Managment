import 'package:flutter/material.dart';
import 'file:///D:/FYP/school_management/lib/screens/Users/Auth_Screen.dart';

class TeacherAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/otaku.png",
              ),
            ),
            accountName: Text(
              "Neeraj",
              style: TextStyle(
                fontFamily: "font2",
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              "neeraj@gmail.com",
              style: TextStyle(
                fontFamily: "font2",
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 15,
              top: 4,
            ),
            child: Text(
              "Attendance",
              style: TextStyle(
                fontFamily: "font2",
                fontSize: 21,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.only(left: 24),
            leading: Icon(
              Icons.assignment_ind,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "Add New Attendance",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              //Navigator.pushNamed(context, AddUserScreen.routeName);
            },
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.only(left: 24),
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
              //Navigator.pushNamed(context, OrderScreen.routeName);
            },
          ),
          Divider(
            thickness: 5,
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
                "Add Assignment",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              //Navigator.pushNamed(context, LibraryOverView.routeName);
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
              //Navigator.pushNamed(context, AuthScreen.routeName);
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
