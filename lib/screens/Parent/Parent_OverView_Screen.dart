import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ParentOverViewScreen extends StatefulWidget {
  @override
  _ParentOverViewScreenState createState() => _ParentOverViewScreenState();
}

class _ParentOverViewScreenState extends State<ParentOverViewScreen> {
  Material data(IconData icons, String title, Color colors) {
    return Material(
      color: Colors.white,
      elevation: 12,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(22),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Parent Overview",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 14,
        ),
        children: [
          data(Icons.assignment, "Check Assignments", Colors.green[400]),
          data(Icons.grading, "Monitor Attendance", Colors.blue),
          data(
              Icons.widgets_rounded, "Manage Your Bills", Colors.purpleAccent),
          data(Icons.calendar_today_outlined, "View Calendar", Colors.red),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 160),
          StaggeredTile.extent(1, 170),
          StaggeredTile.extent(1, 352),
          StaggeredTile.extent(1, 170),
        ],
      ),
    );
  }
}
