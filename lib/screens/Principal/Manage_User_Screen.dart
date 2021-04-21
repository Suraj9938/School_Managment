import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/screens/Principal/Add_UserScreen.dart';
import 'package:school_management/widget/Principal/Users_List_View.dart';

class ManageUserScreen extends StatelessWidget {
  static const routeName = "/manage_users";

  Future<void> _refreshUsers(BuildContext context) async {
    await Provider.of<AuthProvider>(context, listen: false)
        .setFetchedUsersData();
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<AuthProvider>(context, listen: false);

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
      body: FutureBuilder(
        future: _refreshUsers(context),
        builder: (ctx, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => _refreshUsers(context),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Consumer<AuthProvider>(
                      builder: (ctx, user, _) {
                        return ListView.builder(
                          itemBuilder: (ctx, index) => UserListView(
                            user.users[index].userId,
                            user.users[index].name,
                            user.users[index].image,
                          ),
                          itemCount: user.users.length,
                        );
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}
