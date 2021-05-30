import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/screens/Principal/Add_UserScreen.dart';
import 'package:school_management/screens/Principal/Manage_User_Screen.dart';

class UserListView extends StatelessWidget {
  final String userId;
  final String name;
  final String image;

  UserListView(
    this.userId,
    this.name,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);

    return Card(
      elevation: 3,
      child: Container(
        height: 60,
        child: ListTile(
          title: Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontFamily: "font2",
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
          trailing: Container(
            width: 100,
            child: Row(
              children: <Widget>[
                IconButton(
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    Navigator.pushNamed(context, AddUserScreen.routeName,
                        arguments: userId);
                  },
                ),
                IconButton(
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    try {
                      final response = await Provider.of<AuthProvider>(context,
                              listen: false)
                          .deleteUserByID(userId);
                      print("response.statusCode");
                      print(response.statusCode);
                      if (response.statusCode == 200 ||
                          response.statusCode == 201 ||
                          response.statusCode == 204) {
                        return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: Text('Success'),
                                  content:
                                      Text("User was deleted successfully"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Okay'),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                    )
                                  ],
                                )).then(
                          (value) => Navigator.of(context)
                              .pushReplacementNamed(ManageUserScreen.routeName),
                        );
                      } else {
                        return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: Text('Failure'),
                                  content: Text("User could not be removed!"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Okay'),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                    )
                                  ],
                                )).then(
                          (value) => Navigator.of(context)
                              .pushReplacementNamed(ManageUserScreen.routeName),
                        );
                      }
                    } catch (error) {
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text(error.message),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
