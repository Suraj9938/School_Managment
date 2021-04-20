import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/event_provider.dart';
import 'package:school_management/provider/school_provider.dart';
import 'package:school_management/provider/subject_provider.dart';
import 'package:school_management/screens/Calendar_Screen.dart';
import 'package:school_management/screens/Librarian/AddBook_Screen.dart';
import 'package:school_management/screens/Librarian/Librarian_OverView_Screen.dart';
import 'package:school_management/screens/Librarian/Librarian_Profile_Screen.dart';
import 'package:school_management/screens/Librarian/ManageBook_Screen.dart';
import 'package:school_management/screens/Parent/ManageBills_Screen.dart';
import 'package:school_management/screens/Parent/Parent_OverView_Screen.dart';
import 'package:school_management/screens/Parent/Parent_Profile_Screen.dart';
import 'package:school_management/screens/Principal/Add_Class_Screen.dart';
import 'package:school_management/screens/Principal/Add_EventScreen.dart';
import 'package:school_management/screens/Principal/Add_Subject_Screen.dart';
import 'package:school_management/screens/Principal/Edit_School_Screen.dart';
import 'package:school_management/screens/Principal/Manage_School_Screen.dart';
import 'package:school_management/screens/Principal/Add_UserScreen.dart';
import 'package:school_management/screens/Principal/Manage_User_Screen.dart';
import 'package:school_management/screens/Principal/Principal_OverViewScreen.dart';
import 'package:school_management/screens/Principal/Principal_Profile_Screen.dart';
import 'package:school_management/screens/School_Event_Screen.dart';
import 'package:school_management/screens/Student/Student_Profile_Screen.dart';
import 'package:school_management/screens/Student/Student_OverViewScreen.dart';
import 'package:school_management/screens/Teacher/Teacher_OverViewScreen.dart';
import 'package:school_management/screens/Users/AssignmentView_Screen.dart';
import 'package:school_management/screens/Users/Auth_Screen.dart';
import 'package:school_management/screens/Users/View_Attendance_Screen.dart';
import 'package:school_management/widget/Users/SchoolOverViewScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SchoolProvider()),
        ChangeNotifierProvider(create: (_) => SubjectProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
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
        home: PrincipalOverViewScreen(),
        routes: {
          AuthScreen.routeName: (ctx) => AuthScreen(),
          SchoolOverViewScreen.routeName: (ctx) => SchoolOverViewScreen(),
          PrincipalOverViewScreen.routeName: (ctx) => PrincipalOverViewScreen(),
          ParentOverViewScreen.routeName: (ctx) => ParentOverViewScreen(),
          StudentOverViewScreen.routeName: (ctx) => StudentOverViewScreen(),
          CalendarScreen.routeName: (ctx) => CalendarScreen(),
          AddUserScreen.routeName: (ctx) => AddUserScreen(),
          AddEventScreen.routeName: (ctx) => AddEventScreen(),
          AddClassScreen.routeName: (ctx) => AddClassScreen(),
          ManageBillsScreen.routeName: (ctx) => ManageBillsScreen(),
          ManageSchoolScreen.routeName: (ctx) => ManageSchoolScreen(),
          AssignmentViewScreen.routeName: (ctx) => AssignmentViewScreen(),
          LibrarianOverViewScreen.routeName: (ctx) => LibrarianOverViewScreen(),
          TeacherOverviewScreen.routeName: (ctx) => TeacherOverviewScreen(),
          AddSubjectScreen.routeName: (ctx) => AddSubjectScreen(),
          SchoolEventScreen.routeName: (ctx) => SchoolEventScreen(),
          AddBookScreen.routeName: (ctx) => AddBookScreen(),
          EditSchoolScreen.routeName: (ctx) => EditSchoolScreen(),
          ManageUserScreen.routeName: (ctx) => ManageUserScreen(),
          StudentProfileScreen.routeName: (ctx) => StudentProfileScreen(),
          LibrarianProfileScreen.routeName: (ctx) => LibrarianProfileScreen(),
          PrincipalProfileScreen.routeName: (ctx) => PrincipalProfileScreen(),
          ParentProfileScreen.routeName: (ctx) => ParentProfileScreen(),
          ViewAttendanceScreen.routeName: (ctx) => ViewAttendanceScreen(),
          ManageBookScreen.routeName: (ctx) => ManageBookScreen(),
        },
      ),
    );
  }
}

