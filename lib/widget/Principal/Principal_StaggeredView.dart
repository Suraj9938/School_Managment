import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:school_management/screens/Principal/Add_EventScreen.dart';
import 'package:school_management/screens/Principal/Manage_School_Screen.dart';
import 'package:school_management/screens/Users/Calendar_Screen.dart';
import 'package:school_management/screens/Users/NotificationView_Screen.dart';

class PrincipalStaggeredView extends StatefulWidget {
  @override
  _PrincipalStaggeredViewState createState() => _PrincipalStaggeredViewState();
}

class _PrincipalStaggeredViewState extends State<PrincipalStaggeredView> {
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
        data(Icons.supervised_user_circle, "Manage School Detail",
            Colors.green[400], () {
          Navigator.of(context).pushNamed(ManageSchoolScreen.routeName);
        }),
        data(Icons.calendar_today, "Manage Calendar", Colors.blue, () {
          Navigator.of(context).pushNamed(CalendarScreen.routeName);
        }),
        data(Icons.emoji_events_rounded, "Manage Events", Colors.purpleAccent,
            () {
          Navigator.of(context).pushNamed(AddEventScreen.routeName);
        }),
        data(Icons.notifications_active, "View Notifications", Colors.red, () {
          Navigator.of(context).pushNamed(NotificationViewScreen.routeName);
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
