import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/subject.dart';

class SubjectCheckBoxDetails extends StatefulWidget {
  List<String> subjectNames = [];

  SubjectCheckBoxDetails(this.subjectNames);

  @override
  _SubjectCheckBoxDetailsState createState() => _SubjectCheckBoxDetailsState();
}

class _SubjectCheckBoxDetailsState extends State<SubjectCheckBoxDetails> {
  @override
  Widget build(BuildContext context) {
    final loadedSubjects = Provider.of<Subject>(context, listen: false);

    if (loadedSubjects.isChecked == null) {
      setState(() {
        loadedSubjects.isChecked = false;
      });
    }

    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        loadedSubjects.subjectName,
        style: TextStyle(
          fontFamily: "font2",
          fontSize: 16,
        ),
      ),
      selected: loadedSubjects.isChecked,
      value: loadedSubjects.isChecked,
      onChanged: (value) {
        print("checked vaue : $value");
        setState(() {
          loadedSubjects.isChecked = !loadedSubjects.isChecked;
        });
        print(widget.subjectNames);
        //widget.subjectNames.clear();
        if (loadedSubjects.isChecked == true && !widget.subjectNames.contains(loadedSubjects.subjectName)) {
          widget.subjectNames.add(loadedSubjects.subjectName);
          print("subjectNames");
          print(widget.subjectNames);
        } else if (loadedSubjects.isChecked == false && widget.subjectNames.contains(loadedSubjects.subjectName)) {
          widget.subjectNames.removeWhere((element) => element == loadedSubjects.subjectName);
          print("removed subjects");
          print(widget.subjectNames);
        }
      },
    );
  }
}
