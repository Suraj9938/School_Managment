import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/ManageBills_Screen.dart';
import 'package:school_management/SchoolOverViewScreen.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/school_provider.dart';
import 'package:school_management/screens/AssignmentView_Screen.dart';
import 'package:school_management/screens/Auth_Screen.dart';
import 'package:school_management/screens/Calendar_Screen.dart';
import 'package:school_management/screens/Librarian/Librarian_OverView_Screen.dart';
import 'package:school_management/screens/Parent/Parent_OverView_Screen.dart';
import 'package:school_management/screens/Principal/Add_Class_Screen.dart';
import 'package:school_management/screens/Principal/Add_EventScreen.dart';
import 'package:school_management/screens/Principal/Manage_School_Screen.dart';
import 'package:school_management/screens/Principal/Add_UserScreen.dart';
import 'package:school_management/screens/Principal/Principal_OverViewScreen.dart';
import 'package:school_management/screens/Student/Student_OverViewScreen.dart';
import 'package:school_management/screens/StudentScreen.dart';
import 'package:school_management/screens/Teacher/Teacher_OverViewScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SchoolProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "School Management",
        theme: ThemeData(
          //primaryColor: Color.fromRGBO(239, 228, 176, 1.0),
          primaryColor: Colors.orange,
          accentColor: Colors.orangeAccent,
          colorScheme: ColorScheme.light().copyWith(
            primary: Colors.orange,
          ),
        ),
        home: AuthScreen(),
        routes: {
          AuthScreen.routeName: (ctx) => AuthScreen(),
          SchoolOverViewScreen.routeName: (ctx) => SchoolOverViewScreen(),
          PrincipalOverViewScreen.routeName: (ctx) => PrincipalOverViewScreen(),
          ParentOverViewScreen.routeName: (ctx) => ParentOverViewScreen(),
          StudentOverViewScreen.routeName: (ctx) => StudentOverViewScreen(),
          CalendarScreen.routeName: (ctx) => CalendarScreen(),
          StudentScreen.routeName: (ctx) => StudentScreen(),
          AddUserScreen.routeName: (ctx) => AddUserScreen(),
          AddEventScreen.routeName: (ctx) => AddEventScreen(),
          AddClassScreen.routeName: (ctx) => AddClassScreen(),
          ManageBillsScreen.routeName: (ctx) => ManageBillsScreen(),
          ManageSchoolScreen.routeName: (ctx) => ManageSchoolScreen(),
          AssignmentViewScreen.routeName: (ctx) => AssignmentViewScreen(),
          LibrarianOverViewScreen.routeName: (ctx) => LibrarianOverViewScreen(),
          TeacherOverviewScreen.routeName: (ctx) => TeacherOverviewScreen(),
        },
      ),
    );
  }
}

