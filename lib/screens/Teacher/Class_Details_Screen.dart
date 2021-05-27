import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/class_subject.dart';
import 'package:school_management/provider/class_subject_provider.dart';
import 'package:school_management/screens/Teacher/Add_New_Assignment.dart';

class ClassDetails extends StatelessWidget {
  static const routeName = "/class_detail";

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments.toString();
    ClassSubject cs = Provider.of<ClassSubjectProvider>(context, listen: false)
        .getClassSubjectById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select a Subject",
          style:
              TextStyle(color: Colors.white, fontSize: 22, fontFamily: "font1"),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 15,
          top: 10,
        ),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            print("Class and Subject Id");
            print(id);
            print(cs.subjects[index].subjectId);
            return Container(
              margin: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: ListTile(
                title: Text(cs.subjects[index].subjectName),
                onTap: () => Navigator.pushNamed(
                    context, AddNewAssignment.routeName,
                    arguments: {
                      'subjectId': cs.subjects[index].subjectId,
                      'classId': cs.classes.classId,
                    }),
              ),
            );
          },
          itemCount: cs.subjects.length,
        ),
      ),
    );
  }
}
