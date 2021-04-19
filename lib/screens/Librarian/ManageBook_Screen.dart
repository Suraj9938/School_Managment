import 'package:flutter/material.dart';
import 'package:school_management/screens/Librarian/AddBook_Screen.dart';

class ManageBookScreen extends StatelessWidget {
  static const routeName = "/manage_books";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage Books",
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
            icon: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AddBookScreen.routeName);
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 3,
                child: Container(
                  height: 60,
                  child: ListTile(
                    title: Text(
                      "Harry Potter",
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
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.orange,
                            ),
                          ),
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
                      "Harry Potter",
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
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.orange,
                            ),
                          ),
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
                      "Harry Potter",
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
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.orange,
                            ),
                          ),
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
                      "Harry Potter",
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
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.orange,
                            ),
                          ),
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
                      "Harry Potter",
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
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
