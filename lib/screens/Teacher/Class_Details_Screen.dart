import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/class_subject.dart';
import 'package:school_management/provider/class_subject_provider.dart';

class ClassDetails extends StatelessWidget {
  static const routeName = "/class_detail";

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments.toString();
    ClassSubject cs = Provider.of<ClassSubjectProvider>(context, listen: false)
        .getClassSubjectById(id);
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              child: ListTile(
                title: Text(cs.subjects[index].subjectName),
              ),
            );
          },
          itemCount: cs.subjects.length,
        ),
      ),
    );
  }
}
