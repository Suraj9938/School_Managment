import 'package:flutter/material.dart';
import 'package:school_management/widget/Librarian/Librarian_App_Drawer.dart';
import 'package:school_management/widget/Librarian/Librarian_Staggered_View.dart';

class LibrarianOverViewScreen extends StatelessWidget {
  static const routeName = "/librarian_overview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Librarian Overview",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: LibrarianStaggeredView(),
      drawer: LibrarianAppDrawer(),
    );
  }
}