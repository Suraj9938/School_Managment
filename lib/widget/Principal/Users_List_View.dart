import 'package:flutter/material.dart';

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
                  onPressed: () async {},
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
    );
  }
}
