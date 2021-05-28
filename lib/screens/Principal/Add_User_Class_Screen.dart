import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/class.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/class_provider.dart';
import 'package:school_management/provider/user_class_provider.dart';
import 'package:school_management/screens/Principal/Principal_OverViewScreen.dart';

class AddUserClassScreen extends StatefulWidget {
  Class _selectedClass;
  Auth _selectedUser;

  static const routeName = "/add_user_screen";

  @override
  _AddUserClassScreenState createState() => _AddUserClassScreenState();
}

class _AddUserClassScreenState extends State<AddUserClassScreen> {
  bool _isInit = false;
  bool _isLoading = false;
  List<Auth> _users;
  List<Auth> _user = [];
  List<Class> _class = [];

  Future<void> _fetchClass(BuildContext context) async {
    await Provider.of<ClassProvider>(context, listen: false)
        .setFetchClassData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ClassProvider>(context, listen: false)
          .setFetchClassData()
          .then((value) {
        _class = Provider.of<ClassProvider>(context, listen: false).classes;
        widget._selectedClass = _class[0];
        setState(() {
          _isLoading = false;
        });
      });
      Provider.of<AuthProvider>(context, listen: false)
          .setFetchedUsersData()
          .then((value) {
        _users = Provider.of<AuthProvider>(context, listen: false).users;

        _users.forEach((element) {
          if (element.isStudent || element.isParent) {
            _user.add(element);
          }
        });
        print(_user);
        widget._selectedUser = _user[0];
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = true;
  }

  Future<void> _saveForm() async {
    try {
      final response =
          await Provider.of<UserClassProvider>(context, listen: false)
              .addUserClass(widget._selectedUser, widget._selectedClass);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Success'),
                  content: Text("User Class was added successfully"),
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
              .pushReplacementNamed(PrincipalOverViewScreen.routeName),
        );
      } else {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An Error Occurred!'),
                  content: Text("User Class could not be added!"),
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
              .pushReplacementNamed(PrincipalOverViewScreen.routeName),
        );
      }
    } catch (error) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Add User Class",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () => _saveForm()),
        ],
      ),
      body: FutureBuilder(
        future: _fetchClass(context),
        builder: (ctx, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Select a User",
                          style: TextStyle(
                            fontFamily: "font2",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      _isLoading
                          ? CircularProgressIndicator()
                          : Container(
                              width: double.infinity,
                              height: 50,
                              child: DropdownButton<Auth>(
                                items: _user
                                    .map(
                                      (user) => DropdownMenuItem(
                                        child: Text(user.name),
                                        value: user,
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    widget._selectedUser = value;
                                    print("From Add User Class Screen");
                                    print(widget._selectedUser.name);
                                  });
                                },
                                value: widget._selectedUser,
                              ),
                            ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          "Assign a Class",
                          style: TextStyle(
                            fontFamily: "font2",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: DropdownButton<Class>(
                          items: _class
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(e.className),
                                  value: e,
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              widget._selectedClass = value;
                              print("From Add User Class Screen");
                              print(widget._selectedClass.className);
                            });
                          },
                          value: widget._selectedClass,
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
