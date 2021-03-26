// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lms/screens/Book_Screen.dart';
// import 'package:lms/screens/UserProfileScreen.dart';
// import 'package:lms/widget/Library_Scroll.dart';
// import 'package:lms/widget/User_App_Drawer.dart';
//
// class LibraryOverView extends StatefulWidget {
//   static const routeName = "\library_overview";
//   @override
//   _LibraryOverViewState createState() => _LibraryOverViewState();
// }
//
// class _LibraryOverViewState extends State<LibraryOverView> {
//   int _currentPage = 0;
//
//   void onTap(int index) {
//     setState(() {
//       _currentPage = index;
//     });
//   }
//
//   List<Widget> _screens = [
//     LibraryScroll(),
//     UserProfile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_currentPage == 0 ? "Library Management System" : "User Profile"),
//       ),
//       drawer: UserAppDrawer(),
//       body: _screens[_currentPage],
//       bottomNavigationBar: FancyBottomNavigation(
//         initialSelection: _currentPage,
//         onTabChangedListener: onTap,
//         tabs: [
//           TabData(iconData: Icons.home, title: "Home"),
//           TabData(iconData: Icons.supervised_user_circle_rounded, title: "User Profile"),
//         ],
//       ),
//     );
//   }
// }
