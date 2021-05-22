import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/class.dart';
import 'package:school_management/provider/auth_provider.dart';
import 'package:school_management/provider/class_provider.dart';
import 'package:school_management/widget/Principal/ClassDropDownListView.dart';
import 'package:school_management/widget/Principal/StudentDropDownListView.dart';

class AddUserClassScreen extends StatelessWidget {
  static const routeName = "/add_user_screen";
  Class _selectedClass;
  Auth _selectedUser;

  Future<void> _fetchClass(BuildContext context) async {
    await Provider.of<ClassProvider>(context, listen: false)
        .setFetchClassData();
  }

  // save form and add class subject
  // Future<void> _saveForm() async {
  //   print(widget.subjects);
  //   try {
  //     final response =
  //         await Provider.of<ClassSubjectProvider>(context, listen: false)
  //             .addClassSubject(_selectedClass, widget.subjects);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return showDialog(
  //           context: context,
  //           builder: (ctx) => AlertDialog(
  //                 title: Text('Success'),
  //                 content: Text("Class Subject was added successfully"),
  //                 actions: <Widget>[
  //                   FlatButton(
  //                     child: Text('Okay'),
  //                     onPressed: () {
  //                       Navigator.of(ctx).pop();
  //                     },
  //                   )
  //                 ],
  //               )).then(
  //         (value) => Navigator.of(context)
  //             .pushReplacementNamed(PrincipalOverViewScreen.routeName),
  //       );
  //     } else {
  //       return showDialog(
  //           context: context,
  //           builder: (ctx) => AlertDialog(
  //                 title: Text('An Error Occurred!'),
  //                 content: Text("Class Subject could not be added!"),
  //                 actions: <Widget>[
  //                   FlatButton(
  //                     child: Text('Okay'),
  //                     onPressed: () {
  //                       Navigator.of(ctx).pop();
  //                     },
  //                   )
  //                 ],
  //               )).then(
  //         (value) => Navigator.of(context)
  //             .pushReplacementNamed(PrincipalOverViewScreen.routeName),
  //       );
  //     }
  //   } catch (error) {
  //     return null;
  //   }
  // }

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
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
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
                          "Select a Student",
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
                      StudentDropDownListView(_selectedUser),
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
                      ClassDropDownListView(_selectedClass),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
