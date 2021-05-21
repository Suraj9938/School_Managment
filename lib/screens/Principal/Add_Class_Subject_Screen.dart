import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/class.dart';
import 'package:school_management/provider/class_subject_provider.dart';
import 'package:school_management/provider/subject_provider.dart';
import 'package:school_management/screens/Principal/Principal_OverViewScreen.dart';
import 'package:school_management/widget/Principal/ClassDropDownListView.dart';
import 'package:school_management/widget/Principal/Subject_CheckBox_ListView.dart';

class AddClassSubjectScreen extends StatefulWidget {
  List<String> subjects = [];
  Class _selectedClass;

  static const routeName = '/AddClassSubject';

  @override
  _AddClassSubjectScreenState createState() => _AddClassSubjectScreenState();
}

class _AddClassSubjectScreenState extends State<AddClassSubjectScreen> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _fetchSubjects(BuildContext context) async {
    await Provider.of<SubjectProvider>(context, listen: false)
        .setFetchSubjectData();
  }

  @override
  void initState() {
    super.initState();
  }

  // save form and add class subject
  Future<void> _saveForm() async {
    print(widget.subjects);
    print(widget._selectedClass);
    try {
      final response =
          await Provider.of<ClassSubjectProvider>(context, listen: false)
              .addClassSubject(widget._selectedClass, widget.subjects);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Success'),
                  content: Text("Class Subject was added successfully"),
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
                  content: Text("Class Subject could not be added!"),
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
    print("Subjects from AddClassSubjectScreen");
    print(widget.subjects);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Classes",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () => _saveForm()),
        ],
      ),
      body: FutureBuilder(
        future: _fetchSubjects(context),
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
                          "Class Information",
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
                      ClassDropDownListView(widget._selectedClass),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          "Available Subjects",
                          style: TextStyle(
                            fontFamily: "font2",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      SubjectCheckBoxListView(widget.subjects),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
