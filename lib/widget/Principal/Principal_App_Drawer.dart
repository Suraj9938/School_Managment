import 'package:flutter/material.dart';
import 'package:school_management/screens/Auth_Screen.dart';
import 'package:school_management/screens/Principal/Add_Subject_Screen.dart';
import 'package:school_management/screens/Principal/Add_UserScreen.dart';

class PrincipalAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/child.png",
              ),
            ),
            accountName: Text(
              "Billie Eilish",
              style: TextStyle(
                fontFamily: "font2",
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              "eilish.billie@gmail.com",
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
              "Users",
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
              Icons.supervised_user_circle,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "Add New User",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, AddUserScreen.routeName);
            },
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.only(left: 24),
            leading: Icon(
              Icons.rate_review,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "Modify Users",
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
              Icons.subject,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "Add New Subject",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, AddSubjectScreen.routeName);
            },
          ),
          Divider(
            thickness: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.class_,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "Add Class Information",
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
              Icons.assignment_outlined,
              size: 24,
              color: Colors.black54,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-16, 0.0, 0.0),
              child: Text(
                "Manage Routine",
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
