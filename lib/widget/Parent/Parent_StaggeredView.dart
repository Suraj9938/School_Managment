import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:school_management/screens/Parent/ManageBills_Screen.dart';
import 'package:school_management/screens/Users/AssignmentView_Screen.dart';
import 'package:school_management/screens/Users/View_Attendance_Screen.dart';
import 'package:school_management/screens/Users/View_School_Info_Screen.dart';

class ParentStaggeredView extends StatefulWidget {
  @override
  _ParentStaggeredViewState createState() => _ParentStaggeredViewState();
}

class _ParentStaggeredViewState extends State<ParentStaggeredView> {
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
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Material(
                      color: colors,
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            icons,
                            color: Colors.white,
                            size: 28,
                          ),
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
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 14,
      ),
      children: [
        data(Icons.assignment, "Check Assignments", Colors.green[400], () {
          Navigator.of(context).pushNamed(AssignmentViewScreen.routeName);
        }),
        data(Icons.assignment_ind, "Monitor Attendance", Colors.blue, () {
          Navigator.of(context).pushNamed(ViewAttendanceScreen.routeName);
        }),
        data(Icons.widgets_rounded, "Track Student Bills", Colors.purpleAccent,
            () {
          Navigator.of(context).pushNamed(ManageBillsScreen.routeName);
        }),
        data(Icons.school, "View School Info", Colors.red, () {
          Navigator.of(context).pushNamed(ViewSchoolInfoScreen.routeName);
        }),
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 160),
        StaggeredTile.extent(1, 170),
        StaggeredTile.extent(1, 352),
        StaggeredTile.extent(1, 170),
      ],
    );
  }
}
