import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:school_management/screens/Teacher/Add_Assignment_Screen.dart';
import 'package:school_management/screens/Users/View_School_Info_Screen.dart';
import 'package:school_management/screens/Users/Work_In_Progress.dart';

class TeacherStaggeredView extends StatefulWidget {
  @override
  _TeacherStaggeredViewState createState() => _TeacherStaggeredViewState();
}

class _TeacherStaggeredViewState extends State<TeacherStaggeredView> {
  Material data(
      IconData icons, String title, Color colors, Function onPressed) {
    return Material(
      color: Colors.white,
      elevation: 12,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 150,
                      height: 70,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: "font1",
                          color: colors,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Material(
                      color: colors,
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          icons,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 14,
      ),
      children: [
        data(Icons.grading, "Add Attendance", Colors.blue, () {
          Navigator.pushNamed(context, WorkInProgressScreen.routeName);
        }),
        data(Icons.school, "View School Info", Colors.green, () {
          Navigator.pushNamed(context, ViewSchoolInfoScreen.routeName);
        }),
        data(Icons.assignment, "Add Assignment", Colors.purpleAccent, () {
          Navigator.pushNamed(context, AddAssignmentScreen.routeName);
        }),
      ],
      staggeredTiles: [
        StaggeredTile.extent(1, 170),
        StaggeredTile.extent(1, 352),
        StaggeredTile.extent(1, 170),
      ],
    );
  }
}
