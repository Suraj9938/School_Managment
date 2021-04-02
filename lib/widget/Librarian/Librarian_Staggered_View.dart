import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LibrarianStaggeredView extends StatefulWidget {
  @override
  _LibrarianStaggeredViewState createState() => _LibrarianStaggeredViewState();
}

class _LibrarianStaggeredViewState extends State<LibrarianStaggeredView> {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(9),
                    width: 150,
                    height: 70,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: "font1",
                        color: colors,
                        fontWeight: FontWeight.bold,
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
              )
            ],
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
        data(Icons.add_box, "Add New Book", Colors.green[400], () {
          //Navigator.of(context).pushNamed(LibrarianBookScreen.routeName);
        }),
        data(Icons.menu_book_sharp, "Update Books", Colors.blue, () {
          //Navigator.of(context).pushNamed(LibrarianEditScreen.routeName);
        }),
        data(Icons.category, "Add Category", Colors.purpleAccent, () {
          //Navigator.of(context).pushNamed(CategoryScreen.routeName);
        }),
        data(Icons.exit_to_app, "Exit", Colors.redAccent, () {
          //Navigator.pushNamed(context, AuthScreen.routeName);
        }),
      ],
      staggeredTiles: [
        StaggeredTile.extent(1, 328),
        StaggeredTile.extent(1, 158),
        StaggeredTile.extent(1, 158),
        StaggeredTile.extent(2, 170),
      ],
    );
  }
}
