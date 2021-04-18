import 'package:flutter/material.dart';
import 'package:school_management/screens/Principal/Add_UserScreen.dart';

class ManageUserScreen extends StatelessWidget {
  static const routeName = "/manage_users";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage Users",
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, AddUserScreen.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Card(
              elevation: 3,
              child: Container(
                height: 60,
                child: ListTile(
                  title: Text(
                    "Sung Jin Woo",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "font2",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/otaku.png"),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.delete),
                          onPressed: () async {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: Container(
                height: 60,
                child: ListTile(
                  title: Text(
                    "Sung Jin Woo",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "font2",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/otaku.png"),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.delete),
                          onPressed: () async {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: Container(
                height: 60,
                child: ListTile(
                  title: Text(
                    "Sung Jin Woo",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "font2",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/otaku.png"),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.delete),
                          onPressed: () async {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: Container(
                height: 60,
                child: ListTile(
                  title: Text(
                    "Sung Jin Woo",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "font2",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/otaku.png"),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.delete),
                          onPressed: () async {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: Container(
                height: 60,
                child: ListTile(
                  title: Text(
                    "Sung Jin Woo",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "font2",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/otaku.png"),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.delete),
                          onPressed: () async {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: Container(
                height: 60,
                child: ListTile(
                  title: Text(
                    "Sung Jin Woo",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "font2",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/otaku.png"),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.delete),
                          onPressed: () async {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: Container(
                height: 60,
                child: ListTile(
                  title: Text(
                    "Sung Jin Woo",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "font2",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/otaku.png"),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.delete),
                          onPressed: () async {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: Container(
                height: 60,
                child: ListTile(
                  title: Text(
                    "Sung Jin Woo",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "font2",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/otaku.png"),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.delete),
                          onPressed: () async {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
