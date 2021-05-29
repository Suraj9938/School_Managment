import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/assignment.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/provider/assignment_provider.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/user_assignment_provider.dart';
import 'package:school_management/screens/Users/Assignment_Container.dart';

class AssignmentViewScreen extends StatefulWidget {
  static const routeName = "/assignment_view";

  @override
  _AssignmentViewScreenState createState() => _AssignmentViewScreenState();
}

class _AssignmentViewScreenState extends State<AssignmentViewScreen> {
  bool _isInit = false;
  bool _isLoading = false;
  Auth user;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      user = Provider.of<AuthProvider>(context, listen: false).LoggedInUser;
      Provider.of<UserAssignmentProvider>(context, listen: false)
          .setFetchUserAssignment(user)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Assignments",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            fontFamily: "font1",
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : AssignmentContainer(),
    );
  }
}
