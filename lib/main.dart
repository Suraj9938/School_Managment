import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/class_subject.dart';
import 'package:school_management/provider/assignment_provider.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/provider/class_provider.dart';
import 'package:school_management/provider/class_subject_provider.dart';
import 'package:school_management/provider/event_provider.dart';
import 'package:school_management/provider/school_provider.dart';
import 'package:school_management/provider/subject_provider.dart';
import 'package:school_management/provider/user_assignment_provider.dart';
import 'package:school_management/provider/user_book_provider.dart';
import 'package:school_management/provider/user_class_provider.dart';
import 'package:school_management/screens/Librarian/AddBook_Screen.dart';
import 'package:school_management/screens/Librarian/Librarian_OverView_Screen.dart';
import 'package:school_management/screens/Librarian/Librarian_Profile_Screen.dart';
import 'package:school_management/screens/Librarian/ManageBook_Screen.dart';
import 'package:school_management/screens/Parent/ManageBills_Screen.dart';
import 'package:school_management/screens/Parent/Parent_OverView_Screen.dart';
import 'package:school_management/screens/Parent/Parent_Profile_Screen.dart';
import 'package:school_management/screens/Principal/Add_Class_Screen.dart';
import 'package:school_management/screens/Principal/Add_Class_Subject_Screen.dart';
import 'package:school_management/screens/Principal/Add_EventScreen.dart';
import 'package:school_management/screens/Principal/Add_Subject_Screen.dart';
import 'package:school_management/screens/Principal/Add_User_Class_Screen.dart';
import 'package:school_management/screens/Principal/Edit_School_Screen.dart';
import 'package:school_management/screens/Principal/Manage_School_Screen.dart';
import 'package:school_management/screens/Principal/Add_UserScreen.dart';
import 'package:school_management/screens/Principal/Manage_User_Screen.dart';
import 'package:school_management/screens/Principal/Principal_OverViewScreen.dart';
import 'package:school_management/screens/Principal/Principal_Profile_Screen.dart';
import 'package:school_management/screens/Student/Library_Books_Screen.dart';
import 'package:school_management/screens/Student/Student_Profile_Screen.dart';
import 'package:school_management/screens/Student/Student_OverViewScreen.dart';
import 'package:school_management/screens/Teacher/Add_Assignment_Screen.dart';
import 'package:school_management/screens/Teacher/Add_New_Assignment.dart';
import 'package:school_management/screens/Teacher/Class_Details_Screen.dart';
import 'package:school_management/screens/Teacher/Teacher_OverViewScreen.dart';
import 'package:school_management/screens/Teacher/Teacher_Profile_Screen.dart';
import 'package:school_management/screens/Users/AssignmentView_Screen.dart';
import 'package:school_management/screens/Users/Auth_Screen.dart';
import 'package:school_management/screens/Users/Calendar_Add_Screen.dart';
import 'package:school_management/screens/Users/Calendar_Screen.dart';
import 'package:school_management/screens/Users/NotificationView_Screen.dart';
import 'package:school_management/screens/Users/School_Event_Screen.dart';
import 'package:school_management/screens/Users/View_Attendance_Screen.dart';
import 'package:school_management/screens/Users/View_School_Info_Screen.dart';
import 'package:school_management/screens/Users/Work_In_Progress.dart';
import 'package:school_management/widget/Student/Book_Info_Screen.dart';
import 'package:school_management/widget/Users/Event_DetailScreen.dart';
import 'package:school_management/widget/Users/SchoolOverViewScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String _currentClassId;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => ClassSubject()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SchoolProvider()),
        ChangeNotifierProvider(create: (_) => SubjectProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(create: (_) => AssignmentProvider()),
        ChangeNotifierProvider(create: (_) => ClassProvider()),
        ChangeNotifierProvider(create: (_) => ClassSubjectProvider()),
        ChangeNotifierProvider(create: (_) => UserClassProvider()),
        ChangeNotifierProvider(create: (_) => UserAssignmentProvider()),
        ChangeNotifierProvider(create: (_) => UserBookProvider()),
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
          AddUserScreen.routeName: (ctx) => AddUserScreen(),
          AddEventScreen.routeName: (ctx) => AddEventScreen(),
          AddClassScreen.routeName: (ctx) => AddClassScreen(),
          AddClassSubjectScreen.routeName: (ctx) => AddClassSubjectScreen(),
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
          TeacherProfileScreen.routeName: (ctx) => TeacherProfileScreen(),
          LibraryBooksScreen.routeName: (ctx) => LibraryBooksScreen(),
          CalendarAddScreen.routeName: (ctx) => CalendarAddScreen(),
          BookInfoScreen.routeName: (ctx) => BookInfoScreen(),
          AddUserClassScreen.routeName: (ctx) => AddUserClassScreen(),
          NotificationViewScreen.routeName: (ctx) => NotificationViewScreen(),
          EventDetailScreen.routeName: (ctx) => EventDetailScreen(),
          AddAssignmentScreen.routeName: (ctx) => AddAssignmentScreen(),
          ClassDetails.routeName: (ctx) => ClassDetails(),
          AddNewAssignment.routeName: (ctx) => AddNewAssignment(),
          ViewSchoolInfoScreen.routeName: (ctx) => ViewSchoolInfoScreen(),
          WorkInProgressScreen.routeName: (ctx) => WorkInProgressScreen(),
        },
      ),
    );
  }
}
